use strict;
use warnings;

use Template::Extract;
my $extract = Template::Extract->new();

use LWP::UserAgent;
my $ua = LWP::UserAgent->new();
$ua->agent('Mozilla/5.0(X11;Linuxi586; rv:31.0)Gecko/20100101 Fire
+fox/31.0');
my $response = $ua->get('https://www.jawapos.com/');
my $content = $response->content;

my $template = <<'.';
<div class="container-itemmainnews">[% FOREACH record %]
[% ... %]
<h2 class="home-headline-title">[% Title %]</h2>
[% ... %]
<p class="min-height-hl-summary">[% Text %]</p>
[% ... %]
[% END %]
</div>
.

my $data = $extract->extract($template,$content);

use Data::Dumper;
print Dumper $data;
