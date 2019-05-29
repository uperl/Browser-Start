package Browser::Start;

use strict;
use warnings;
use 5.008001;
use URI;
use URI::file;
use File::chdir;
use base qw( Exporter );

our @EXPORT = qw( open_url );

# ABSTRACT: Open a URL in a web browser
# VERSION

=head1 SYNOPSIS

 use Browser::Start;
 
 open_url 'http://metacpan.org';

=head1 DESCRIPTION

Simple interface for opening a URL in a browser appropriate for the system
and user configuration.

=head1 FUNCTIONS

=head2 open_url

 open_url $url;

Opens the given URL in a browser.  If this module doesn't know how to open
a URL in your configuration or if this module can determine that the
URL didn't open correctly then an exception will be thrown.

This function is fire-and-forget, that is it won't interrupt your script.
The browser should open the URL in a separate windows, or tab of an existing
window.

=cut

sub _url ($)
{
  URI->new_abs(shift, URI::file->new("$CWD"))->as_string;
}

sub open_url ($)
{
  my $url = _url shift;

  if($^O eq 'darwin')
  {
    if(-x "/usr/bin/open")
    {
      system('/usr/bin/open', $url);
      return;
    }
  }

  die "system not supported";
}

1;

=head1 CAVEATS

There is a lot of variability in environments, so doing this correctly everywhere
is a huge challenge.  The distribution for this module will do what it can to fail
loudly when it knows it won't work, rather than silently fail, so you may at least
to some extent rely on this module if it installed correctly.

Some environments may be configured to use non-browsers for some URL times.  An
FTP or sftp URL might open in some sort of file transfer client.

=head1 SEE ALSO

=over 4

=item L<Browser::Open>

This module provides a similar functionality.  For me, it doesn't support some
platforms well or at all that I intend of supporting, and some of the options it
chooses are dated or will interrupt the terminal the Perl script is running in
(example: C<lynx>).

=back

=cut
