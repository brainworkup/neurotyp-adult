#show: report.with(
$if(title)$
  title: "$title$",
$endif$

$if(name)$
  name: [$name$],
$endif$

$if(doe)$
  doe: [$doe$],
$endif$

$if(patient)$
  patient: [$patient$],
$endif$

$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    ( name: [$it.name.literal$],
      affiliation: [$for(it.affiliations)$$it.name$$sep$, $endfor$],
      email: [$it.email$] ),
$endif$
$endfor$
    ),
$endif$

$if(date)$
  date: [$date$],
$endif$

$if(lang)$
  lang: "$lang$",
$endif$

$if(region)$
  region: "$region$",
$endif$

$if(abstract)$
  abstract: [$abstract$],
$endif$

// $if(margin)$
//   margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
// $endif$

$if(margin)$
  margin: ($for(margin/pairs)$
    $margin.key$: $margin.value$
    $if(!loop.last)$,$endif$
  $endfor$),
$endif$

$if(papersize)$
  paper: "$papersize$",
$endif$

$if(mainfont)$
  font: ("$mainfont$",),
$endif$

$if(fontsize)$
  fontsize: $fontsize$,
$endif$

$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$

$if(toc)$
  toc: $toc$,
$endif$
)
