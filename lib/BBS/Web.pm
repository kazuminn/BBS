package BBS::Web;
use strict;
use warnings;
use utf8;
use parent qw/BBS Amon2::Web/;
use File::Spec;

$ENV{'PERL_LWP_SSL_VERIFY_HOSTNAME'} = 0;

# dispatcher
use BBS::Web::Dispatcher;
sub dispatch {
    return (BBS::Web::Dispatcher->dispatch($_[0]) or die "response is not generated");
}

# load plugins
__PACKAGE__->load_plugins(
    'Web::FillInFormLite',
    'Web::JSON',
    '+BBS::Web::Plugin::Session',
);

# setup view
use BBS::Web::View;
{
    sub create_view {
        my $view = BBS::Web::View->make_instance(__PACKAGE__);
        no warnings 'redefine';
        *BBS::Web::create_view = sub { $view }; # Class cache.
        $view
    }
}

# for your security
__PACKAGE__->add_trigger(
    AFTER_DISPATCH => sub {
        my ( $c, $res ) = @_;

        # http://blogs.msdn.com/b/ie/archive/2008/07/02/ie8-security-part-v-comprehensive-protection.aspx
        $res->header( 'X-Content-Type-Options' => 'nosniff' );

        # http://blog.mozilla.com/security/2010/09/08/x-frame-options/
        $res->header( 'X-Frame-Options' => 'DENY' );

        # Cache control.
        $res->header( 'Cache-Control' => 'private' );
    },
);

__PACKAGE__->load_plugin('Web::Auth', {
		module => 'Twitter',
		on_finished => sub {
			my ($c, $access_token, $access_token_secret, $user_id, $screen_name) = @_;
			warn $user_id;
			warn $screen_name;
			warn $access_token;
			warn $access_token_secret;
			$c->session->set('name' => $screen_name);
			$c->session->set('site' => 'twitter');
			return $c->redirect('/');
		}
	});


1;
