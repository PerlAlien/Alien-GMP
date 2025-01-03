# Alien::GMP ![static](https://github.com/PerlAlien/Alien-GMP/workflows/static/badge.svg) ![linux](https://github.com/PerlAlien/Alien-GMP/workflows/linux/badge.svg)

Alien package for the GNU Multiple Precision library.

# SYNOPSIS

In your Build.PL:

```perl
use Module::Build;
use Alien::GMP;
my $builder = Module::Build->new(
  ...
  configure_requires => {
    'Alien::GMP' => '0',
    ...
  },
  extra_compiler_flags => Alien::GMP->cflags,
  extra_linker_flags   => Alien::GMP->libs,
  ...
);

$build->create_build_script;
```

In your Makefile.PL:

```perl
use ExtUtils::MakeMaker;
use Config;
use Alien::GMP;

WriteMakefile(
  ...
  CONFIGURE_REQUIRES => {
    'Alien::GMP' => '0',
  },
  CCFLAGS => Alien::GMP->cflags . " $Config{ccflags}",
  LIBS    => [ Alien::GMP->libs ],
  ...
);
```

# DESCRIPTION

This distribution installs GMP so that it can be used by other Perl distributions.  If already
installed for your operating system, and it can be found, this distribution will use the GMP
that comes with your operating system, otherwise it will download it from the Internet, build and
install it for you.

## C++ support

This Alien will provide the C++ bindings for GMP (libgmpxx) if possible.  If you do not have a
C++ compiler, or if your operating system vendor provides a GMP package without the needed C++
files then it will not be available.  To use the C++ bindings, you can use the `alt` method
to create a C++ instance of this GMP Alien.  For example:

```perl
use ExtUtils::MakeMaker;
use Config;
use Alien::GMP;

WriteMakefile(
  ...
  CONFIGURE_REQUIRES => {
    'Alien::GMP' => '1.06', # require version that provides C++ bindings
  },
  CCFLAGS => Alien::GMP->alt('gmpxx')->cflags . " $Config{ccflags}",
  LIBS    => [ Alien::GMP->alt('gmpxx')->libs ],
  ...
);
```

# Inline support

This module supports [Inline's with functionality](https://metacpan.org/pod/Inline#Playing-with-Others).

# SEE ALSO

[GMP](https://gmplib.org/)

# AUTHOR

Original author: Richard Simões (RSIMOES)

Current maintainer: Graham Ollis <plicease@cpan.org>

Contributors:

Zakariyya Mughal (ZMUGHAL)

William N. Braswell, Jr. (WBRASWELL)

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2012-2024 by Richard Simões.

This is free software, licensed under:

```
The GNU Lesser General Public License, Version 3, June 2007
```
