# Digraphs in vim

* :h digraph

| char  | digraph   | hex   | dec   | name                                      |
|------:|----------:|:-----:|:-----:|:-----------------------------------------:|
|‐      |	-1      |2010   |8208   |HYPHEN                                     |
|–      |	-N      |2013   |8211   |EN DASH                                    |
|—      |	-M      |2014   |8212   |EM DASH                                    |
|―      |	-3      |2015   |8213   |HORIZONTAL BAR                             |
|‖      |	!2      |2016   |8214   |DOUBLE VERTICAL LINE                       |
|‗      |	=2      |2017   |8215   |DOUBLE LOW LINE                            |
|‘      |	'6      |2018   |8216   |LEFT SINGLE QUOTATION MARK                 |
|’      |	'9      |2019   |8217   |RIGHT SINGLE QUOTATION MARK                |
|‚      |	.9      |201A   |8218   |SINGLE LOW-9 QUOTATION MARK                |
|‛      |	9'      |201B   |8219   |SINGLE HIGH-REVERSED-9 QUOTATION MARK      |
|“      |	"6      |201C   |8220   |LEFT DOUBLE QUOTATION MARK                 |
|”      |	"9      |201D   |8221   |RIGHT DOUBLE QUOTATION MARK                |
|„      |	:9      |201E   |8222   |DOUBLE LOW-9 QUOTATION MARK                |
|‟      |	9"      |201F   |8223   |DOUBLE HIGH-REVERSED-9 QUOTATION MARK      |
|†      |	/-      |2020   |8224   |DAGGER                                     |
|‡      |	/=      |2021   |8225   |DOUBLE DAGGER                              |
|‥      |	..      |2025   |8229   |TWO DOT LEADER                             |
|…      |	,.      |2026   |8230   |HORIZONTAL ELLIPSIS                        |
|‰      |	%0      |2030   |8240   |PER MILLE SIGN                             |
|′      |	1'      |2032   |8242   |PRIME                                      |
|″      |	2'      |2033   |8243   |DOUBLE PRIME                               |
|‴      |	3'      |2034   |8244   |TRIPLE PRIME                               |
|‵      |	1"      |2035   |8245   |REVERSED PRIME                             |
|‶      |	2"      |2036   |8246   |REVERSED DOUBLE PRIME                      |
|‷      |	3"      |2037   |8247   |REVERSED TRIPLE PRIME                      |
|‸      |	Ca      |2038   |8248   |CARET                                      |
|‹      |	<1      |2039   |8249   |SINGLE LEFT-POINTING ANGLE QUOTATION MARK  |
|›      |	>1      |203A   |8250   |SINGLE RIGHT-POINTING ANGLE QUOTATION MARK |
|※      |	:X      |203B   |8251   |REFERENCE MARK                             |
|‾      |	'-      |203E   |8254   |OVERLINE                                   |
|⁄      |	/f      |2044   |8260   |FRACTION SLASH                             |
|⁰      |	0S      |2070   |8304   |SUPERSCRIPT ZERO                           |
|⁴      |	4S      |2074   |8308   |SUPERSCRIPT FOUR                           |
|⁵      |	5S      |2075   |8309   |SUPERSCRIPT FIVE                           |
|⁶      |	6S      |2076   |8310   |SUPERSCRIPT SIX                            |
|⁷      |	7S      |2077   |8311   |SUPERSCRIPT SEVEN                          |
|⁸      |	8S      |2078   |8312   |SUPERSCRIPT EIGHT                          |
|⁹      |	9S      |2079   |8313   |SUPERSCRIPT NINE                           |
|⁺      |	+S      |207A   |8314   |SUPERSCRIPT PLUS SIGN                      |
|⁻      |	-S      |207B   |8315   |SUPERSCRIPT MINUS                          |
|⁼      |	=S      |207C   |8316   |SUPERSCRIPT EQUALS SIGN                    |
|⁽      |	(S      |207D   |8317   |SUPERSCRIPT LEFT PARENTHESIS               |
|⁾      |	)S      |207E   |8318   |SUPERSCRIPT RIGHT PARENTHESIS              |
|ⁿ      |	nS      |207F   |8319   |SUPERSCRIPT LATIN SMALL LETTER N           |
|₀      |	0s      |2080   |8320   |SUBSCRIPT ZERO                             |
|₁      |	1s      |2081   |8321   |SUBSCRIPT ONE                              |
|₂      |	2s      |2082   |8322   |SUBSCRIPT TWO                              |
|₃      |	3s      |2083   |8323   |SUBSCRIPT THREE                            |
|₄      |	4s      |2084   |8324   |SUBSCRIPT FOUR                             |
|₅      |	5s      |2085   |8325   |SUBSCRIPT FIVE                             |
|₆      |	6s      |2086   |8326   |SUBSCRIPT SIX                              |
|₇      |	7s      |2087   |8327   |SUBSCRIPT SEVEN                            |
|₈      |	8s      |2088   |8328   |SUBSCRIPT EIGHT                            |
|₉      |	9s      |2089   |8329   |SUBSCRIPT NINE                             |
|₊      |	+s      |208A   |8330   |SUBSCRIPT PLUS SIGN                        |
|₋      |	-s      |208B   |8331   |SUBSCRIPT MINUS                            |
|₌      |	=s      |208C   |8332   |SUBSCRIPT EQUALS SIGN                      |
|₍      |	(s      |208D   |8333   |SUBSCRIPT LEFT PARENTHESIS                 |
|₎      |	)s      |208E   |8334   |SUBSCRIPT RIGHT PARENTHESIS                |
|₤      |	Li      |20A4   |8356   |LIRA SIGN                                  |
|₧      |	Pt      |20A7   |8359   |PESETA SIGN                                |
|₩      |	W=      |20A9   |8361   |WON SIGN                                   |
|€      |	Eu      |20AC   |8364   |EURO SIGN                                  |
|₽      |	=R      |20BD   |8381   |ROUBLE SIGN                                |
|₽      |	=P      |20BD   |8381   |ROUBLE SIGN                                |
|℃      |	oC      |2103   |8451   |DEGREE CELSIUS                             |
|℅      |	co      |2105   |8453   |CARE OF                                    |
|℉      |	oF      |2109   |8457   |DEGREE FAHRENHEIT                          |
|№      |	N0      |2116   |8470   |NUMERO SIGN                                |
|℗      |	PO      |2117   |8471   |SOUND RECORDING COPYRIGHT                  |
|℞      |	Rx      |211E   |8478   |PRESCRIPTION TAKE                          |
|℠      |	SM      |2120   |8480   |SERVICE MARK                               |
|™      |	TM      |2122   |8482   |TRADE MARK SIGN                            |
|Ω      |	Om      |2126   |8486   |OHM SIGN                                   |
|Å      |	AO      |212B   |8491   |ANGSTROM SIGN                              |
|⅓      |	13      |2153   |8531   |VULGAR FRACTION ONE THIRD                  |
|⅔      |	23      |2154   |8532   |VULGAR FRACTION TWO THIRDS                 |
|⅕      |	15      |2155   |8533   |VULGAR FRACTION ONE FIFTH                  |
|⅖      |	25      |2156   |8534   |VULGAR FRACTION TWO FIFTHS                 |
|⅗      |	35      |2157   |8535   |VULGAR FRACTION THREE FIFTHS               |
|⅘      |	45      |2158   |8536   |VULGAR FRACTION FOUR FIFTHS                |
|⅙      |	16      |2159   |8537   |VULGAR FRACTION ONE SIXTH                  |
|⅚      |	56      |215A   |8538   |VULGAR FRACTION FIVE SIXTHS                |
|⅛      |	18      |215B   |8539   |VULGAR FRACTION ONE EIGHTH                 |
|⅜      |	38      |215C   |8540   |VULGAR FRACTION THREE EIGHTHS              |
|⅝      |	58      |215D   |8541   |VULGAR FRACTION FIVE EIGHTHS               |
|⅞      |	78      |215E   |8542   |VULGAR FRACTION SEVEN EIGHTHS              |
|Ⅰ      |	1R      |2160   |8544   |ROMAN NUMERAL ONE                          |
|Ⅱ      |	2R      |2161   |8545   |ROMAN NUMERAL TWO                          |
|Ⅲ      |	3R      |2162   |8546   |ROMAN NUMERAL THREE                        |
|Ⅳ      |	4R      |2163   |8547   |ROMAN NUMERAL FOUR                         |
|Ⅴ      |	5R      |2164   |8548   |ROMAN NUMERAL FIVE                         |
|Ⅵ      |	6R      |2165   |8549   |ROMAN NUMERAL SIX                          |
|Ⅶ      |	7R      |2166   |8550   |ROMAN NUMERAL SEVEN                        |
|Ⅷ      |	8R      |2167   |8551   |ROMAN NUMERAL EIGHT                        |
|Ⅸ      |	9R      |2168   |8552   |ROMAN NUMERAL NINE                         |
|Ⅹ      |	aR      |2169   |8553   |ROMAN NUMERAL TEN                          |
|Ⅺ      |	bR      |216A   |8554   |ROMAN NUMERAL ELEVEN                       |
|Ⅻ      |	cR      |216B   |8555   |ROMAN NUMERAL TWELVE                       |
|ⅰ      |	1r      |2170   |8560   |SMALL ROMAN NUMERAL ONE                    |
|ⅱ      |	2r      |2171   |8561   |SMALL ROMAN NUMERAL TWO                    |
|ⅲ      |	3r      |2172   |8562   |SMALL ROMAN NUMERAL THREE                  |
|ⅳ      |	4r      |2173   |8563   |SMALL ROMAN NUMERAL FOUR                   |
|ⅴ      |	5r      |2174   |8564   |SMALL ROMAN NUMERAL FIVE                   |
|ⅵ      |	6r      |2175   |8565   |SMALL ROMAN NUMERAL SIX                    |
|ⅶ      |	7r      |2176   |8566   |SMALL ROMAN NUMERAL SEVEN                  |
|ⅷ      |	8r      |2177   |8567   |SMALL ROMAN NUMERAL EIGHT                  |
|ⅸ      |	9r      |2178   |8568   |SMALL ROMAN NUMERAL NINE                   |
|ⅹ      |	ar      |2179   |8569   |SMALL ROMAN NUMERAL TEN                    |
|ⅺ      |	br      |217A   |8570   |SMALL ROMAN NUMERAL ELEVEN                 |
|ⅻ      |	cr      |217B   |8571   |SMALL ROMAN NUMERAL TWELVE                 |
|←      |	<-      |2190   |8592   |LEFTWARDS ARROW                            |
|↑      |	-!      |2191   |8593   |UPWARDS ARROW                              |
|→      |	->      |2192   |8594   |RIGHTWARDS ARROW                           |
|↓      |	-v      |2193   |8595   |DOWNWARDS ARROW                            |
|↔      |	<>      |2194   |8596   |LEFT RIGHT ARROW                           |
|↕      |	UD      |2195   |8597   |UP DOWN ARROW                              |
|⇐      |	<=      |21D0   |8656   |LEFTWARDS DOUBLE ARROW                     |
|⇒      |	=>      |21D2   |8658   |RIGHTWARDS DOUBLE ARROW                    |
|⇔      |	==      |21D4   |8660   |LEFT RIGHT DOUBLE ARROW                    |
|∀      |	FA      |2200   |8704   |FOR ALL                                    |
|∂      |	dP      |2202   |8706   |PARTIAL DIFFERENTIAL                       |
|∃      |	TE      |2203   |8707   |THERE EXISTS                               |
|∅      |	/0      |2205   |8709   |EMPTY SET                                  |
|∆      |	DE      |2206   |8710   |INCREMENT                                  |
|∇      |	NB      |2207   |8711   |NABLA                                      |
|∈      |	(-      |2208   |8712   |ELEMENT OF                                 |
|∋      |	-)      |220B   |8715   |CONTAINS AS MEMBER                         |
|∏      |	*P      |220F   |8719   |N-ARY PRODUCT                              |
|∑      |	+Z      |2211   |8721   |N-ARY SUMMATION                            |
|−      |	-2      |2212   |8722   |MINUS SIGN                                 |
|∓      |	-+      |2213   |8723   |MINUS-OR-PLUS SIGN                         |
|∗      |	*-      |2217   |8727   |ASTERISK OPERATOR                          |
|∘      |	Ob      |2218   |8728   |RING OPERATOR                              |
|∙      |	Sb      |2219   |8729   |BULLET OPERATOR                            |
|√      |	RT      |221A   |8730   |SQUARE ROOT                                |
|∝      |	0(      |221D   |8733   |PROPORTIONAL TO                            |
|∞      |	00      |221E   |8734   |INFINITY                                   |
|∟      |	-L      |221F   |8735   |RIGHT ANGLE                                |
|∠      |	-V      |2220   |8736   |ANGLE                                      |
|∥      |	PP      |2225   |8741   |PARALLEL TO                                |
|∧      |	AN      |2227   |8743   |LOGICAL AND                                |
|∨      |	OR      |2228   |8744   |LOGICAL OR                                 |
|∩      |	(U      |2229   |8745   |INTERSECTION                               |
|∪      |	)U      |222A   |8746   |UNION                                      |
|∫      |	In      |222B   |8747   |INTEGRAL                                   |
|∬      |	DI      |222C   |8748   |DOUBLE INTEGRAL                            |
|∮      |	Io      |222E   |8750   |CONTOUR INTEGRAL                           |
|∴      |	.:      |2234   |8756   |THEREFORE                                  |
|∵      |	:.      |2235   |8757   |BECAUSE                                    |
|∶      |	:R      |2236   |8758   |RATIO                                      |
|∷      |	::      |2237   |8759   |PROPORTION                                 |
|∼      |	?1      |223C   |8764   |TILDE OPERATOR                             |
|∾      |	CG      |223E   |8766   |INVERTED LAZY S                            |
|≃      |	?-      |2243   |8771   |ASYMPTOTICALLY EQUAL TO                    |
|≅      |	?=      |2245   |8773   |APPROXIMATELY EQUAL TO                     |
|≈      |	?2      |2248   |8776   |ALMOST EQUAL TO                            |
|≌      |	=?      |224C   |8780   |ALL EQUAL TO                               |
|≓      |	HI      |2253   |8787   |IMAGE OF OR APPROXIMATELY EQUAL TO         |
|≠      |	!=      |2260   |8800   |NOT EQUAL TO                               |
|≡      |	=3      |2261   |8801   |IDENTICAL TO                               |
|≤      |	=<      |2264   |8804   |LESS-THAN OR EQUAL TO                      |
|≥      |	>=      |2265   |8805   |GREATER-THAN OR EQUAL TO                   |
|≪      |	<*      |226A   |8810   |MUCH LESS-THAN                             |
|≫      |	*>      |226B   |8811   |MUCH GREATER-THAN                          |
|≮      |	!<      |226E   |8814   |NOT LESS-THAN                              |
|≯      |	!>      |226F   |8815   |NOT GREATER-THAN                           |
|⊂      |	(C      |2282   |8834   |SUBSET OF                                  |
|⊃      |	)C      |2283   |8835   |SUPERSET OF                                |
|⊆      |	(_      |2286   |8838   |SUBSET OF OR EQUAL TO                      |
|⊇      |	)_      |2287   |8839   |SUPERSET OF OR EQUAL TO                    |
|⊙      |	0.      |2299   |8857   |CIRCLED DOT OPERATOR                       |
|⊚      |	02      |229A   |8858   |CIRCLED RING OPERATOR                      |
|⊥      |	-T      |22A5   |8869   |UP TACK                                    |
|⋅      |	.P      |22C5   |8901   |DOT OPERATOR                               |
|⋮      |	:3      |22EE   |8942   |VERTICAL ELLIPSIS                          |
|⋯      |	.3      |22EF   |8943   |MIDLINE HORIZONTAL ELLIPSIS                |
|⌂      |	Eh      |2302   |8962   |HOUSE                                      |
|⌈      |	<7      |2308   |8968   |LEFT CEILING                               |
|⌉      |	>7      |2309   |8969   |RIGHT CEILING                              |
|⌊      |	7<      |230A   |8970   |LEFT FLOOR                                 |
|⌋      |	7>      |230B   |8971   |RIGHT FLOOR                                |
|⌐      |	NI      |2310   |8976   |REVERSED NOT SIGN                          |
|⌒      |	(A      |2312   |8978   |ARC                                        |
|⌕      |	TR      |2315   |8981   |TELEPHONE RECORDER                         |
|⌠      |	Iu      |2320   |8992   |TOP HALF INTEGRAL                          |
|⌡      |	Il      |2321   |8993   |BOTTOM HALF INTEGRAL                       |
||〈	|</         |2329   |9001   |LEFT-POINTING ANGLE BRACKET                |
||〉	|/>         |232A   |9002   |RIGHT-POINTING ANGLE BRACKET               |
|␣      |	Vs      |2423   |9251   |OPEN BOX                                   |
|⑀      |	1h      |2440   |9280   |OCR HOOK                                   |
|⑁      |	3h      |2441   |9281   |OCR CHAIR                                  |
|⑂      |	2h      |2442   |9282   |OCR FORK                                   |
|⑃      |	4h      |2443   |9283   |OCR INVERTED FORK                          |
|⑆      |	1j      |2446   |9286   |OCR BRANCH BANK IDENTIFICATION             |
|⑇      |	2j      |2447   |9287   |OCR AMOUNT OF CHECK                        |
|⑈      |	3j      |2448   |9288   |OCR DASH                                   |
|⑉      |	4j      |2449   |9289   |OCR CUSTOMER ACCOUNT NUMBER                |
|⒈      |	1.      |2488   |9352   |DIGIT ONE FULL STOP                        |
|⒉      |	2.      |2489   |9353   |DIGIT TWO FULL STOP                        |
|⒊      |	3.      |248A   |9354   |DIGIT THREE FULL STOP                      |
|⒋      |	4.      |248B   |9355   |DIGIT FOUR FULL STOP                       |
|⒌      |	5.      |248C   |9356   |DIGIT FIVE FULL STOP                       |
|⒍      |	6.      |248D   |9357   |DIGIT SIX FULL STOP                        |
|⒎      |	7.      |248E   |9358   |DIGIT SEVEN FULL STOP                      |
|⒏      |	8.      |248F   |9359   |DIGIT EIGHT FULL STOP                      |
|⒐      |	9.      |2490   |9360   |DIGIT NINE FULL STOP                       |
|─      |	hh      |2500   |9472   |BOX DRAWINGS LIGHT HORIZONTAL              |
|━      |	HH      |2501   |9473   |BOX DRAWINGS HEAVY HORIZONTAL              |
|│      |	vv      |2502   |9474   |BOX DRAWINGS LIGHT VERTICAL                |
|┃      |	VV      |2503   |9475   |BOX DRAWINGS HEAVY VERTICAL                |
|┄      |	3-      |2504   |9476   |BOX DRAWINGS LIGHT TRIPLE DASH HORIZONTAL  |
|┅      |	3_      |2505   |9477   |BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL  |
|┆      |	3!      |2506   |9478   |BOX DRAWINGS LIGHT TRIPLE DASH VERTICAL    |
|┇      |	3/      |2507   |9479   |BOX DRAWINGS HEAVY TRIPLE DASH VERTICAL    |
|┈      |	4-      |2508   |9480   |BOX DRAWINGS LIGHT QUADRUPLE DASH HORIZONTA|
|┉      |	4_      |2509   |9481   |BOX DRAWINGS HEAVY QUADRUPLE DASH HORIZONTA|
|┊      |	4!      |250A   |9482   |BOX DRAWINGS LIGHT QUADRUPLE DASH VERTICAL |
|┋      |	4/      |250B   |9483   |BOX DRAWINGS HEAVY QUADRUPLE DASH VERTICAL |
|┌      |	dr      |250C   |9484   |BOX DRAWINGS LIGHT DOWN AND RIGHT          |
|┍      |	dR      |250D   |9485   |BOX DRAWINGS DOWN LIGHT AND RIGHT HEAVY    |
|┎      |	Dr      |250E   |9486   |BOX DRAWINGS DOWN HEAVY AND RIGHT LIGHT    |
|┏      |	DR      |250F   |9487   |BOX DRAWINGS HEAVY DOWN AND RIGHT          |
|┐      |	dl      |2510   |9488   |BOX DRAWINGS LIGHT DOWN AND LEFT           |
|┑      |	dL      |2511   |9489   |BOX DRAWINGS DOWN LIGHT AND LEFT HEAVY     |
|┒      |	Dl      |2512   |9490   |BOX DRAWINGS DOWN HEAVY AND LEFT LIGHT     |
|┓      |	LD      |2513   |9491   |BOX DRAWINGS HEAVY DOWN AND LEFT           |
|└      |	ur      |2514   |9492   |BOX DRAWINGS LIGHT UP AND RIGHT            |
|┕      |	uR      |2515   |9493   |BOX DRAWINGS UP LIGHT AND RIGHT HEAVY      |
|┖      |	Ur      |2516   |9494   |BOX DRAWINGS UP HEAVY AND RIGHT LIGHT      |
|┗      |	UR      |2517   |9495   |BOX DRAWINGS HEAVY UP AND RIGHT            |
|┘      |	ul      |2518   |9496   |BOX DRAWINGS LIGHT UP AND LEFT             |
|┙      |	uL      |2519   |9497   |BOX DRAWINGS UP LIGHT AND LEFT HEAVY       |
|┚      |	Ul      |251A   |9498   |BOX DRAWINGS UP HEAVY AND LEFT LIGHT       |
|┛      |	UL      |251B   |9499   |BOX DRAWINGS HEAVY UP AND LEFT             |
|├      |	vr      |251C   |9500   |BOX DRAWINGS LIGHT VERTICAL AND RIGHT      |
|┝      |	vR      |251D   |9501   |BOX DRAWINGS VERTICAL LIGHT AND RIGHT HEAVY|
|┠      |	Vr      |2520   |9504   |BOX DRAWINGS VERTICAL HEAVY AND RIGHT LIGHT|
|┣      |	VR      |2523   |9507   |BOX DRAWINGS HEAVY VERTICAL AND RIGHT      |
|┤      |	vl      |2524   |9508   |BOX DRAWINGS LIGHT VERTICAL AND LEFT       |
|┥      |	vL      |2525   |9509   |BOX DRAWINGS VERTICAL LIGHT AND LEFT HEAVY |
|┨      |	Vl      |2528   |9512   |BOX DRAWINGS VERTICAL HEAVY AND LEFT LIGHT |
|┫      |	VL      |252B   |9515   |BOX DRAWINGS HEAVY VERTICAL AND LEFT       |
|┬      |	dh      |252C   |9516   |BOX DRAWINGS LIGHT DOWN AND HORIZONTAL     |
|┯      |	dH      |252F   |9519   |BOX DRAWINGS DOWN LIGHT AND HORIZONTAL HEAV|
|┰      |	Dh      |2530   |9520   |BOX DRAWINGS DOWN HEAVY AND HORIZONTAL LIGH|
|┳      |	DH      |2533   |9523   |BOX DRAWINGS HEAVY DOWN AND HORIZONTAL     |
|┴      |	uh      |2534   |9524   |BOX DRAWINGS LIGHT UP AND HORIZONTAL       |
|┷      |	uH      |2537   |9527   |BOX DRAWINGS UP LIGHT AND HORIZONTAL HEAVY |
|┸      |	Uh      |2538   |9528   |BOX DRAWINGS UP HEAVY AND HORIZONTAL LIGHT |
|┻      |	UH      |253B   |9531   |BOX DRAWINGS HEAVY UP AND HORIZONTAL       |
|┼      |	vh      |253C   |9532   |BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL |
|┿      |	vH      |253F   |9535   |BOX DRAWINGS VERTICAL LIGHT AND HORIZONTAL |
|╂      |	Vh      |2542   |9538   |BOX DRAWINGS VERTICAL HEAVY AND HORIZONTAL |
|╋      |	VH      |254B   |9547   |BOX DRAWINGS HEAVY VERTICAL AND HORIZONTAL |
|╱      |	FD      |2571   |9585   |BOX DRAWINGS LIGHT DIAGONAL UPPER RIGHT    |
|╲      |	BD      |2572   |9586   |BOX DRAWINGS LIGHT DIAGONAL UPPER LEFT     |
|▀      |	TB      |2580   |9600   |UPPER HALF BLOCK                           |
|▄      |	LB      |2584   |9604   |LOWER HALF BLOCK                           |
|█      |	FB      |2588   |9608   |FULL BLOCK                                 |
|▌      |	lB      |258C   |9612   |LEFT HALF BLOCK                            |
|▐      |	RB      |2590   |9616   |RIGHT HALF BLOCK                           |
|░      |	.S      |2591   |9617   |LIGHT SHADE                                |
|▒      |	:S      |2592   |9618   |MEDIUM SHADE                               |
|▓      |	?S      |2593   |9619   |DARK SHADE                                 |
|■      |	fS      |25A0   |9632   |BLACK SQUARE                               |
|□      |	OS      |25A1   |9633   |WHITE SQUARE                               |
|▢      |	RO      |25A2   |9634   |WHITE SQUARE WITH ROUNDED CORNERS          |
|▣      |	Rr      |25A3   |9635   |WHITE SQUARE CONTAINING BLACK SMALL SQUARE |
|▤      |	RF      |25A4   |9636   |SQUARE WITH HORIZONTAL FILL                |
|▥      |	RY      |25A5   |9637   |SQUARE WITH VERTICAL FILL                  |
|▦      |	RH      |25A6   |9638   |SQUARE WITH ORTHOGONAL CROSSHATCH FILL     |
|▧      |	RZ      |25A7   |9639   |SQUARE WITH UPPER LEFT TO LOWER RIGHT FILL |
|▨      |	RK      |25A8   |9640   |SQUARE WITH UPPER RIGHT TO LOWER LEFT FILL |
|▩      |	RX      |25A9   |9641   |SQUARE WITH DIAGONAL CROSSHATCH FILL       |
|▪      |	sB      |25AA   |9642   |BLACK SMALL SQUARE                         |
|▬      |	SR      |25AC   |9644   |BLACK RECTANGLE                            |
|▭      |	Or      |25AD   |9645   |WHITE RECTANGLE                            |
|▲      |	UT      |25B2   |9650   |BLACK UP-POINTING TRIANGLE                 |
|△      |	uT      |25B3   |9651   |WHITE UP-POINTING TRIANGLE                 |
|▶      |	PR      |25B6   |9654   |BLACK RIGHT-POINTING TRIANGLE              |
|▷      |	Tr      |25B7   |9655   |WHITE RIGHT-POINTING TRIANGLE              |
|▼      |	Dt      |25BC   |9660   |BLACK DOWN-POINTING TRIANGLE               |
|▽      |	dT      |25BD   |9661   |WHITE DOWN-POINTING TRIANGLE               |
|◀      |	PL      |25C0   |9664   |BLACK LEFT-POINTING TRIANGLE               |
|◁      |	Tl      |25C1   |9665   |WHITE LEFT-POINTING TRIANGLE               |
|◆      |	Db      |25C6   |9670   |BLACK DIAMOND                              |
|◇      |	Dw      |25C7   |9671   |WHITE DIAMOND                              |
|◊      |	LZ      |25CA   |9674   |LOZENGE                                    |
|○      |	0m      |25CB   |9675   |WHITE CIRCLE                               |
|◎      |	0o      |25CE   |9678   |BULLSEYE                                   |
|●      |	0M      |25CF   |9679   |BLACK CIRCLE                               |
|◐      |	0L      |25D0   |9680   |CIRCLE WITH LEFT HALF BLACK                |
|◑      |	0R      |25D1   |9681   |CIRCLE WITH RIGHT HALF BLACK               |
|◘      |	Sn      |25D8   |9688   |INVERSE BULLET                             |
|◙      |	Ic      |25D9   |9689   |INVERSE WHITE CIRCLE                       |
|◢      |	Fd      |25E2   |9698   |BLACK LOWER RIGHT TRIANGLE                 |
|◣      |	Bd      |25E3   |9699   |BLACK LOWER LEFT TRIANGLE                  |
|★      |	*2      |2605   |9733   |BLACK STAR                                 |
|☆      |	*1      |2606   |9734   |WHITE STAR                                 |
|☜      |	<H      |261C   |9756   |WHITE LEFT POINTING INDEX                  |
|☞      |	>H      |261E   |9758   |WHITE RIGHT POINTING INDEX                 |
|☺      |	0u      |263A   |9786   |WHITE SMILING FACE                         |
|☻      |	0U      |263B   |9787   |BLACK SMILING FACE                         |
|☼      |	SU      |263C   |9788   |WHITE SUN WITH RAYS                        |
|♀      |	Fm      |2640   |9792   |FEMALE SIGN                                |
|♂      |	Ml      |2642   |9794   |MALE SIGN                                  |
|♠      |	cS      |2660   |9824   |BLACK SPADE SUIT                           |
|♡      |	cH      |2661   |9825   |WHITE HEART SUIT                           |
|♢      |	cD      |2662   |9826   |WHITE DIAMOND SUIT                         |
|♣      |	cC      |2663   |9827   |BLACK CLUB SUIT                            |
|♩      |	Md      |2669   |9833   |QUARTER NOTE                               |
|♪      |	M8      |266A   |9834   |EIGHTH NOTE                                |
|♫      |	M2      |266B   |9835   |BEAMED EIGHTH NOTES                        |
|♭      |	Mb      |266D   |9837   |MUSIC FLAT SIGN                            |
|♮      |	Mx      |266E   |9838   |MUSIC NATURAL SIGN                         |
|♯      |	MX      |266F   |9839   |MUSIC SHARP SIGN                           |
|✓      |	OK      |2713   |10003  |CHECK MARK                                 |
|✗      |	XX      |2717   |10007  |BALLOT X                                   |
|✠      |	-X      |2720   |10016  |MALTESE CROSS                              |
|　     |	IS      |3000   |12288  |IDEOGRAPHIC SPACE                          |
|、     |	,_      |3001   |12289  |IDEOGRAPHIC COMMA                          |
|。     |	._      |3002   |12290  |IDEOGRAPHIC FULL STOP                      |
|〃     |	+"      |3003   |12291  |DITTO MARK                                 |
|〄     |	+_      |3004   |12292  |JAPANESE INDUSTRIAL STANDARD SYMBOL        |
|々     |	*_      |3005   |12293  |IDEOGRAPHIC ITERATION MARK                 |
|〆     |	;_      |3006   |12294  |IDEOGRAPHIC CLOSING MARK                   |
|〇     |	0_      |3007   |12295  |IDEOGRAPHIC NUMBER ZERO                    |
|《     |	<+      |300A   |12298  |LEFT DOUBLE ANGLE BRACKET                  |
|》     |	>+      |300B   |12299  |RIGHT DOUBLE ANGLE BRACKET                 |
|「     |	<'      |300C   |12300  |LEFT CORNER BRACKET                        |
|」     |	>'      |300D   |12301  |RIGHT CORNER BRACKET                       |
|『     |	<"      |300E   |12302  |LEFT WHITE CORNER BRACKET                  |
|』     |	>"      |300F   |12303  |RIGHT WHITE CORNER BRACKET                 |
|【     |	("      |3010   |12304  |LEFT BLACK LENTICULAR BRACKET              |
|】     |	)"      |3011   |12305  |RIGHT BLACK LENTICULAR BRACKET             |
|〒     |	=T      |3012   |12306  |POSTAL MARK                                |
|〓     |	=_      |3013   |12307  |GETA MARK                                  |
|〔     |	('      |3014   |12308  |LEFT TORTOISE SHELL BRACKET                |
|〕     |	)'      |3015   |12309  |RIGHT TORTOISE SHELL BRACKET               |
|〖     |	(I      |3016   |12310  |LEFT WHITE LENTICULAR BRACKET              |
|〗     |	)I      |3017   |12311  |RIGHT WHITE LENTICULAR BRACKET             |
|〜     |	-?      |301C   |12316  |WAVE DASH                                  |
