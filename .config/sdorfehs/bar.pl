#!/usr/bin/perl

use strict;
use warnings;
use autodie qw(:all);

my $pipe_name = '$ENV{XDG_CONFIG_HOME}/sdorfehs/bar';  # Replace with the actual path to your named pipe

# Create the named pipe if it doesn't exist
unless (-e $pipe_name) {
    system("mkfifo", $pipe_name) == 0 or die "Failed to create named pipe: $!";
}

# Open the named pipe for writing
open(my $pipe_fh, '>', $pipe_name) or die "Failed to open named pipe: $!";
$pipe_fh->autoflush(1);  # Enable autoflush on the pipe

# Loop to feed information to the sdorfehs-bar.pl script
while (1) {
    # Prompt for input
    print "Enter information to send to sdorfehs-bar.pl (or 'quit' to exit): ";
    my $input = <STDIN>;
    chomp $input;

    # Check for 'quit' command
    if ($input eq 'quit') {
        last;  # Exit the loop
    }

    # Write the input to the named pipe
    print $pipe_fh "$input\n";
}

# Close the named pipe
close($pipe_fh);
