use Data::Dumper;

my $obj= UserAgent;
my $template = << '.';
<ul>[% FOREACH RECORD %]
<li><A HREF ="[% url %]">[% title %]</A>: [% rate %] - [% coment %].
[% ... %]
[% END %]</ul>
.

my $ua = LWP::UserAgent->new;
my $response = $ua->get( $url );
print $response->content if $response->is_success;

print "i'm done!\n"
