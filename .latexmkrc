$pdf_mode = 1;
$dvi_mode = $postscript_mode = 0;
$pdflatex = 'lualatex -synctex=1 %O %S';
$out_dir = 'build';

$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $dvi_previewer = "open %S";
    $pdf_previewer = "open %S";
} else {
    $dvi_previewer = "start %S";
    $pdf_previewer = "start %S";
}

push @generated_exts, "synctex.gz(busy)";
push @generated_exts, "xmpdata";

$clean_ext .= ' synctex.gz(busy) xmpdata';
