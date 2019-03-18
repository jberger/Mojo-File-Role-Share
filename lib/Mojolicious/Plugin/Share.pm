package Mojolicious::Plugin::Share;

use Mojo::Base 'Mojolicious::Plugin';

use Mojo::File;

sub register {
  my ($plugin, $app, $conf) = @_;
  my $dist = $conf->{dist} || (ref $app =~ s/::/-/r);
  my $share = Mojo::File->with_roles('+Share')->new($dist);

  $app->helper(share => sub { $share });

  push @{ $app->renderer->paths }, $share->child('templates');
  push @{ $app->static->paths }, $share->child('public');

  return $share;
}

1;

