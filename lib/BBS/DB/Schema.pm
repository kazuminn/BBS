package BBS::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'BBS::DB::Row';

table {
    name 'user';
    pk 'user_id';
    columns qw/user_id screen_name session/;
};

table {
    name 'entry';
    pk 'id';
    columns qw/screen_name body/;
};

1;
