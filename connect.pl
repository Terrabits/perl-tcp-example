#!/usr/bin/env perl

use IO::Socket;

# connect via tcp socket
my $instr = new IO::Socket::INET(PeerAddr => "rsa22471.local:5025");
die "$!" unless $instr;

# query id string
# Note: '\n' delimits each read/write
my $id_string = "";
$instr->send("*IDN?\n");
$instr->recv($id_string, 512);

print $id_string;

#
# TODO: YOUR CODE HERE
#

# put instrument back into local mode
$instr->send("@LOC\n");

# close connection
shutdown($instr, 1);
