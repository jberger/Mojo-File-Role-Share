package Mojo::File::Role::Share;

use Role::Tiny;

use File::Share ();

sub share { $_[0]->new(File::Share::dist_dir($_[1])) }

1;

