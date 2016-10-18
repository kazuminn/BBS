use File::Spec;
use File::Basename qw(dirname);
my $basedir = File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), '..'));
my $dbpath = File::Spec->catfile($basedir, 'db', 'development.db');
+{
    'DBI' => [
        "dbi:SQLite:dbname=$dbpath", '', '',
        +{
            sqlite_unicode => 1,
        }
    ],
Auth => +{
	    Twitter => +{
		    consumer_key    => 'VX8btJcvkLRv7LxYPPeUQqafq',
		    consumer_secret => 'iRjSjEmsEmgHJdjyLLRLQayAEAjXg8gXUCF2PUL9eqgO8VJwS6',
		    ssl => 0,
	    },
    },
};
