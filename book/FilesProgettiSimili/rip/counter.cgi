#!/usr/bin/perl

open iif,"< counter.dat";
my $num=int <iif>;
close iif; 
open oof, "> counter.dat";
$num++; 
print oof $num;
close oof; 
print "Content-Type: text/plain\nContent-length: 16\n\nVisite: $num   \n\n";
#open iif,"<../index.ht2"; 
#print join "", <iif>; 
#close iif; 

#if ($ENV{"QUERY_STRING"} ne "") 
#{ print "<br>Visite: $num\n\n";
#}; 
