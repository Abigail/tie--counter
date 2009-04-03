package Tie::Counter;

#
# $Id: Counter.pm,v 1.1 1999/07/20 03:03:06 abigail Exp abigail $
#
# $Log: Counter.pm,v $
# Revision 1.1  1999/07/20 03:03:06  abigail
# Initial revision
#
#

use strict;

use vars qw /$VERSION/;

$VERSION = '$Revision: 1.1 $' =~ /([\d.]+)/;


sub TIESCALAR {
    my $class     =   shift;
    my $value     =   shift;  #  ?? 0;  # Would have been nice....
       $value     =   0 unless defined $value;
    bless \$value => $class;
}

sub FETCH     {
    ${+shift} ++;
}

sub STORE     {
    my $self  = shift;
    my $value = shift;
    $$self    = $value;
}


"End of Tie::Counter";

__END__

=pod

=head1 NAME

Tie::Counter - Have a counter in a scalar.

=head1 SYNOPSIS

    use Tie::Counter;

    tie my $counter => 'Tie::Counter';

    my @array = qw /Red Green Blue/;

    foreach my $colour (@array) {           # Prints:
        print "  $counter  $colour\n";      #   0  Red
    }                                       #   1  Green
                                            #   2  Blue
    

=head1 DESCRIPTION

C<Tie::Counter> allows you to tie a scalar in such a way that it increments
each time it is used. This might be useful for interpolating counters in
strings.

The tie takes an optional extra argument, the first value of the counter,
defaulting to 0. Any argument for which magical increment is defined on 
is allowed. Assigning to the counter will set a new value.

=head1 REVISION HISTORY

    $Log: Counter.pm,v $
    Revision 1.1  1999/07/20 03:03:06  abigail
    Initial revision


=head1 AUTHOR

This package was written by Abigail.

=head1 COPYRIGHT and LICENSE

This package is copyright 1999 by Abigail.

This program is free and open software. You may use, copy, modify,
distribute and sell this program (and any modified variants) in any way
you wish, provided you do not restrict others to do the same.

=cut
