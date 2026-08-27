pop-lorem
=========

`pop_lorem` is a python lorem ipsum generator for the console that spits out
pop song lyrics instead of Cicero. It is a fork of
[per9000/lorem](https://github.com/per9000/lorem) by Per Erik Strandberg with the
literary quotes swapped for Katy Perry, Icona Pop, Natasha Bedingfield, Britney
Spears, Carly Rae Jepsen, Kesha and Avril Lavigne.

Same CLI as upstream, only the sources changed.

Install
-------

Single python script, no dependencies. Clone and put it on your `PATH`:

    $ git clone https://github.com/Gabrigeno/pop-lorem.git
    $ ln -s "$PWD/pop-lorem/pop_lorem" ~/.local/bin/pop_lorem   # or /usr/local/bin

Or just copy it: `install -m 755 pop-lorem/pop_lorem /usr/local/bin/pop_lorem`.

Usage
-----

By default it still outputs the classic stuff:

    $ ./pop_lorem
    Lorem ipsum dolor sit amet,

Pick a song and a number of words:

    $ ./pop_lorem -n 7 --katy
    You change your mind like a girl

Or select the source by index (0 is lorem, 1 is Katy, 2 is Icona Pop, ...):

    $ ./pop_lorem -q 3 -n 6
    I am unwritten Can't read my

Lines:

    $ ./pop_lorem --circus -l 2
    There's only two types of people in the world The ones that entertain, and the
    ones that observe Well, baby, I'm a put-on-a-show kind of girl Don't like the

Sentences (split on `.;!?` — songs without punctuation count as one long sentence):

    $ ./pop_lorem --carley -s 1
    I threw a wish in the well, Don't ask me, I'll never tell I looked to you as it
    fell, And now you're in my way I'd trade my soul for a wish, Pennies and dimes
    for a kiss I wasn't looking for this, But now you're in my way Your stare was
    holdin', Ripped jeans, skin was showin' Hot night, wind was blowin' Where you
    think you're going, baby.

Characters (beware of the trailing newline):

    $ ./pop_lorem --kesha -c 40 | wc -c
    41

Case and shuffling:

    $ ./pop_lorem --lavigne --upper -n 4
    UH HUH, LIFE'S LIKE

    $ ./pop_lorem --icona --lower -n 8 --randomize
    on watched, down different into the don't love

Help
----

    $ ./pop_lorem -h
    usage: pop_lorem [-h] [-v] [-t] [--cols COLS] [--words N] [--sentences S]
                     [--lines L] [--chars C] [--lorem] [--katy] [--icona] [--rain]
                     [--circus] [--call_me_maybe] [--die_young] [--complicated]
                     [-q Q] [--lower] [--upper] [--randomize]

    pop-lorem - Create more or less random lorem ipsum text.

    options:
      -h, --help            show this help message and exit
      -v, --version         show program's version number and exit
      -t                    run self-tests and exit
      --cols COLS           override line width - default 80 (set to 0 for no line
                            returns)

    output format (mutually exclusive):
      --words, -n N         number of words
      --sentences, -s S     number of sentences
      --lines, -l L         number of lines
      --chars, -c C         number of characters (excl. final newline)

    quote selection:
      --lorem, --cicero     "Lorem ipsum dolor sit amet..."
      --katy, --hot_n_cold  "You change your mind like a girl changes clothes ..."
      --icona, --i_love_it  "I dont care, I love it..."
      --rain, --unwritten   "feels the rain..."
      --circus, --britney   "There's only two types of people in the world..."
      --call_me_maybe, --carley
                            "call me maybe..."
      --die_young, --kesha  "We re gonna die youg..."
      --complicated, --lavigne
                            "Chill out, what ya yellin for ..."
      -q, --quote Q         select source by index instead, q = 1, 2, ...

    options for sentences:
      --lower               all lower case (default false)
      --upper               all upper case (default false)
      --randomize           randomize order (default false)

Tests
-----

    $ ./pop_lorem -t        # doctests
    $ ./sanitycheck.sh      # end-to-end word/sentence/char/line counts
    $ ./code_analysis.sh    # pylint + pep8

License
-------

GNU General Public License v3 or later, see [LICENSE](LICENSE).

* Copyright (C) 2014 Per Erik Strandberg — original `lorem`
* Copyright (C) 2026 Gabriele Genovesi — `pop-lorem` fork

Song lyrics remain the property of their respective owners and are included
only as placeholder text.
