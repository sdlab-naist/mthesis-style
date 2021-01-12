#!/usr/bin/env perl
$pdf_mode         = 3;
$latex            = 'platex -halt-on-error -file-line-error';
$latex_silent     = 'platex -halt-on-error -file-line-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
