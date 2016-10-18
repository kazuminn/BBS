package BBS::Web::Dispatcher;
use strict;
use warnings;

use Amon2::Web::Dispatcher::Lite;

any '/' => sub {
    my ($c) = @_;
    return $c->render( "home.tx"   );
};

any '/BBS' => sub {
    my ($c) = @_;

    my @users = $c->db->search(
        user => {
        }, {
            limit    => 10,
        }
    );


    my @entries = $c->db->search(
        entry => {
        }, {
            limit    => 10,
        }
    );
    return $c->render( "BBS.tx" => { entries => \@entries, users => \@users, } );
};

post '/post' => sub {
    my ($c) = @_;
    my $cnt = $c->session->get('cnt'); 

    if (my $body = $c->req->param('body')) {
        $c->db->insert(
            entry => +{
                body => $body,
            }
        );
    }
    return $c->redirect('/BBS');
};

1;
