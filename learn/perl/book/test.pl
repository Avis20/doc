#!/usr/local/bin/perl -w

use strict;

{ 
    package MyTest;
    sub test { print $0 . "\n" };
}

MyTest::test();

