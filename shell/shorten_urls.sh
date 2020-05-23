if [ -n "$1" ]; then
        var="$1"
    else
        echo
        echo "Usage: shorten_urls.sh <URL>"
        echo 
        echo "Example - shorten_ruls.sh http://www.apple.com"
        exit
fi

/Users/jpwalker/scripts/libwww-perl-5.836/shorten.pl $1
