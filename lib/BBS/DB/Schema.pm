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
    pk 'entry_id';
    columns qw/entry_id body/;
};

1;
