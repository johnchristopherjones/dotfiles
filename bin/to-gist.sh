#!/usr/bin/env python3
"""Convert markdown to executable source file."""
import argparse
import sys


def literate(text, lang=None):
    """Convert literate source file to executable source file."""
    code = False
    if lang is None:
        lang = ''
    for line in text:
        if line.startswith('```' + lang) and not code:
            code = not code
            yield '// ' + line
            yield '\n'
        elif line.startswith('```') and code:
            code = not code
            yield '\n'
            yield '// ' + line
        elif not code:
            yield '// ' + line
        else:
            yield line


def parse_args(args):
    """Parse commandline arguments."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('-l', '--lang', nargs='?', type=str)
    parser.add_argument('infile', nargs='?', type=argparse.FileType('r'),
                        default=sys.stdin)
    parser.add_argument('outfile', nargs='?', type=argparse.FileType('w'),
                        default=sys.stdout)
    return parser.parse_args(args)


def main(args):
    """Execute script according to commandline arguments."""
    for line in literate(args.infile, args.lang):
        print(line, end='')


if __name__ == '__main__':
    args = parse_args(sys.argv[1:])
    main(args)
