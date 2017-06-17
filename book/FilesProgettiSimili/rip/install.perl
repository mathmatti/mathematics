#!/usr/bin/perl 
#######################################################################
# questo e' l' elenco dei files con caratteristiche speciali. 
# vanno modificati secondo il sito da installare.  
# lo standard per un file e' 744

my $specials="
install:700
_pas_send.cgi:755
sitobox.html:766

ges:755
res:755
res/desc:755
res/img:755

ges/_suaction.cgi:755
ges/_sulogin.cgi:755
ges/dbase.log:766
ges/clogs.cgi:755
ges/counter.cgi:755
ges/counter.dat:766
ges/database.cgi:777
ges/dollaro.val:766
ges/new_users.cgi:766
res/database.cgi:777
res/dbase.cgi:755
res/del_prodotto.cgi:755
res/ins_prodotto.cgi:755

";

sub is_special
{ my ($fl)=@_; 
   
  my $acc=""; 
  foreach $f(split("\n", $specials))
  { my ($file, $att)=split(":", $f); 
    if ($file eq $fl) { $acc=$att; }; 
  }
  return $acc; 
}

#######################################################################
# il comando find di un*x.  

use strict; 

sub my_find
{ my ($dir,  $rest)=@_;
  my $res = "";
  #print "my find". $dir."\n";
  #cerca nelle sottodir. un file la cui ext. corrsponda. 
  opendir  curr, $dir ;
  my @elems = readdir(curr);
  my $e; 
  closedir(curr);
  
  foreach $e(@elems)
  { { 
      { $res = $res.$dir."/".$e."\n"; }
    } 
 
    if (index($e, ".")<0) 
    { $res = $res . &my_find($dir."/".$e); 
    }
  }

  return $res; 
}



#######################################################################
# main. 
	
print "Questo script installa il sito sul server ftp.
Va lanciato esclusivamente dalla dir. dove si trova.
Premi invio per continuare o ctrl-c per interrompere.
";
<>; 
print "Ftp Server:"; 
my $ftp=<>; 
print "Username:"; 
my $user=<>; 
print "Password:";
my $pass=<>;
print "dir. sul sito (invio per main):"; my $dir=<>; 
$ftp=join("", split("\n", $ftp));  
$user=join("", split("\n", $user));  
$pass=join("", split("\n", $pass));  
$dir=join("", split("\n", $dir));  

print "ftp://".$user.":".$pass."@".$ftp."\n"; 
my $home=$ENV{'HOME'};  
open OF, ">".$home."/.netrc"; 
print OF "default login ".$user." password ".$pass."@".$ftp."\n"; 
close OF;  

print "\ntento il trasferimento di file.. \n"; 

open FL, "|ftp ".$ftp; 
#open FL, "|more"; 
print "login\n"; 
print FL "\n\n";
print FL "user ".$user." ".$pass."\n"; 
print FL "user ".$user." ".$pass."\n"; 
my $a=<FL>; print $a;
print FL "binary on\nbinary on\n"; 
print FL "\n\n";
print "creo la dir. di lavoro."; 
if ($dir ne "")
{ print FL "mkdir ".$dir."\n"; 
  print FL "chmod 755 ".$dir."\n";  
}
my @files = split("\n", my_find(".")); 

my $file; 
foreach $file(@files)
{ $file = substr($file,2); 
  if (($file ne ".") && ($file ne "..") &&
       ((index ("/.", $file)) <0) ) 
  { if ((index($file, ".")) <0)
    { print "crea la dir: ".$dir."/".$file."\n";
      if ($dir ne "")
      { print FL "mkdir ".$dir."/".$file."\n"; }
      else
      { print FL "mkdir ".$file."\n"; }
 
      my $i=<FL>; print $i; 
    }
    else 
    { print "copia il file: ".$file."\n"; 
      # se e' una CGI passo al modo ascii. 
      if ((index ($file, ".cgi"))>0)
      { print FL "ascii\n"; 
      } 
      if ($dir ne "")
      { print FL "put ".$file." ".$dir."/".$file."\n"; }
      else 
      { print FL "put ".$file." ".$file."\n"; }; 
      if ((index ($file, ".cgi"))>0)
      { print FL "binary\n"; 
      } 
      my $i=<FL>; print $i;  
    };
    my $mod=is_special($file); 
    if ($mod ne "")
    { print "cambia mod. di accesso: ".$file." ".$mod."\n"; 
      print FL "chmod ".$mod." ".$dir."/".$file."\n"; 
      my $i=<FL>; print $i;  
    };
  };        
};
print "lavoro completato.\n"; 
print FL "bye\n"; 
#for(;;)
#{ my $a=<FL>; 
#  print $a; 
#}
  