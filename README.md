# johnchristopherjones' dotfiles

This is a collection of the [dotfiles](http://dotfiles.github.io/) that I use to
set up a system just the way I like it.

This repo uses [Dotbot](https://github.com/anishathalye/dotbot) to handle
the installation and management of the dotfiles symlinks.

Whilst used primarily used on OS X, these dotfiles should also work on a Linux-based
system. Maybe.

I customize on top of these configs with a private `dotfiles_local` repository,
which I install in parallel with this one.
You'll find guarded includes for various `*_local` files within.
This top-secret repo contains some personal credentials and has branches for
customizing my dotfiles for machines that need special jiggery-pokery.

### Naming Convention

All of the files *without* dots at the start are the actual dotfiles this
repository was created to handle. The dots are correctly prefixed to the names
by Dotbot when they are linked into place.

The files *with* dots at the start of their names are used in the installation of
the dotfiles and the management of the repository.

## Installation

To install these dotfiles on your system, simply:

```
$ git clone https://github.com/johnchristopherjones/dotfiles.git
$ ./dotfiles/install
```

This will create a symlink in the correct place in your home directory to each
dotfile. The install script is idempotent - running it multiple times won't
cause any issues; it will just update the git submodules.

Note that all private data is stored in a separate, private, `dotfiles_local`
repository, as demonstrated by [Anish].  If you try to use my dotfiles you'll
probably want to do something similar.
[Anish]: https://github.com/anishathalye/dotfiles-local

## Credits

Several other projects have provided me with ideas (and sometimes just a little
code!) for this project:

 - Mathias Bynens' [excellent collection of OS
   X defaults](https://github.com/mathiasbynens/dotfiles/blob/master/.osx).
 - Steve Losh's [detailed and lengthy
   dotfiles](https://bitbucket.org/sjl/dotfiles).
 - Jamie's [Dotfiles readme](https://github.com/daviesjamie/dotfiles) and
   ["Why didn't I think of that" OS X and Brew scripts](
     https://github.com/daviesjamie/dotfiles).
 - Anish's [excellent introduction to managing you dotfiles](
     http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/) and Dotbot.
 - Jimmy Theis' [spiffy guide to using Dropbox for private repos](
    http://jetheis.com/blog/2013/02/17/using-dropbox-as-a-private-github/).
