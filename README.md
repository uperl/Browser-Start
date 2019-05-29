# Browser::Start [![Build Status](https://secure.travis-ci.org/plicease/Browser-Start.png)](http://travis-ci.org/plicease/Browser-Start)

Open a URL in a web browser

# SYNOPSIS

    use Browser::Start;
    
    open_url 'http://metacpan.org';

# DESCRIPTION

Simple interface for opening a URL in a browser appropriate for the system
and user configuration.

# FUNCTIONS

## open\_url

    open_url $url;

Opens the given URL in a browser.  If this module doesn't know how to open
a URL in your configuration or if this module can determine that the
URL didn't open correctly then an exception will be thrown.

This function is fire-and-forget, that is it won't interrupt your script.
The browser should open the URL in a separate windows, or tab of an existing
window.

# CAVEATS

There is a lot of variability in environments, so doing this correctly everywhere
is a huge challenge.  The distribution for this module will do what it can to fail
loudly when it knows it won't work, rather than silently fail, so you may at least
to some extent rely on this module if it installed correctly.

Some environments may be configured to use non-browsers for some URL times.  An
FTP or sftp URL might open in some sort of file transfer client.

# SEE ALSO

- [Browser::Open](https://metacpan.org/pod/Browser::Open)

    This module provides a similar functionality.  For me, it doesn't support some
    platforms well or at all that I intend of supporting, and some of the options it
    chooses are dated or will interrupt the terminal the Perl script is running in
    (example: `lynx`).

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2019 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
