package Alien::GMP;

use strict;
use warnings;
use parent 'Alien::Base';
use Role::Tiny::With qw( with );

# VERSION
# ABSTRACT: Alien package for the GNU Multiple Precision library.

with 'Alien::Role::Alt';

1;
