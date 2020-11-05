Tools for converting R expressions to latex mathematical equations. This
project is scratch from the [section 21.3 transforms mathematically R
code into its LaTeX
equivalent](https://adv-r.hadley.nz/translation.html#latex).

Usage
-----

### Special symbols

    library(rlatexmath)
    translate_latexmath(pi)

*π*

    # quoted object
    translate_latexmath_(quote(pi))

*π*

### Know funcitons

<table>
<thead>
<tr class="header">
<th>R expression</th>
<th>latex math</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><b>Binary operators</b></td>
<td></td>
</tr>
<tr class="even">
<td>x + y</td>
<td><span class="math inline"><em>x</em> + <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x - y</td>
<td><span class="math inline"><em>x</em> − <em>y</em></span></td>
</tr>
<tr class="even">
<td>x * y</td>
<td><span class="math inline"><em>x</em><em>y</em></span></td>
</tr>
<tr class="odd">
<td>x / y</td>
<td><span class="math inline"><em>x</em>/<em>y</em></span></td>
</tr>
<tr class="even">
<td>x %+-% y</td>
<td><span class="math inline"><em>x</em> ± <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %/% y</td>
<td><span class="math inline"><em>x</em> ÷ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %*% y</td>
<td><span class="math inline"><em>x</em> × <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %.% y</td>
<td><span class="math inline"><em>x</em> ⋅ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x[i]</td>
<td><span class="math inline"><em>x</em><sub><em>i</em></sub></span></td>
</tr>
<tr class="odd">
<td>x^i</td>
<td><span class="math inline"><em>x</em><sup><em>i</em></sup></span></td>
</tr>
<tr class="even">
<td><b>Grouping</b></td>
<td></td>
</tr>
<tr class="odd">
<td>(x + y)</td>
<td><span class="math inline">(<em>x</em>+<em>y</em>)</span></td>
</tr>
<tr class="even">
<td>{x y}</td>
<td><span class="math inline"><em>x</em> + <em>y</em></span></td>
</tr>
<tr class="odd">
<td><b>Juxtaposition</b></td>
<td></td>
</tr>
<tr class="even">
<td>paste(x, y, z)</td>
<td><span class="math inline"><em>x</em><em>y</em><em>z</em></span></td>
</tr>
<tr class="odd">
<td><b>Comma separated lists</b></td>
<td></td>
</tr>
<tr class="even">
<td>list(x + y, z)</td>
<td><span class="math inline"><em>x</em> + <em>y</em>, <em>z</em></span></td>
</tr>
<tr class="odd">
<td><b>Fractions</b></td>
<td></td>
</tr>
<tr class="even">
<td>frac(x, y)</td>
<td><span class="math inline">$\frac{x}{y}$</span></td>
</tr>
<tr class="odd">
<td>atop(x, y)</td>
<td><span class="math inline">$x \atop y$</span></td>
</tr>
<tr class="even">
<td><b>Ellipsis</b></td>
<td></td>
</tr>
<tr class="odd">
<td>list(x[1], cdots, x[2])</td>
<td><span class="math inline"><em>x</em><sub>1</sub>, ⋯, <em>x</em><sub>2</sub></span></td>
</tr>
<tr class="even">
<td>list(x[1], ldots, x[2])</td>
<td><span class="math inline"><em>x</em><sub>1</sub>, …, <em>x</em><sub>2</sub></span></td>
</tr>
<tr class="odd">
<td><b>Radicals</b></td>
<td></td>
</tr>
<tr class="even">
<td>sqrt(x)</td>
<td><span class="math inline">$\sqrt[]{x}$</span></td>
</tr>
<tr class="odd">
<td>sqrt(x, y)</td>
<td><span class="math inline">$\sqrt[y]{x}$</span></td>
</tr>
<tr class="even">
<td><b>Relation</b></td>
<td></td>
</tr>
<tr class="odd">
<td>x == y</td>
<td><span class="math inline"><em>x</em> = <em>y</em></span></td>
</tr>
<tr class="even">
<td>x != y</td>
<td><span class="math inline"><em>x</em> ≠ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x &lt; y</td>
<td><span class="math inline"><em>x</em> &lt; <em>y</em></span></td>
</tr>
<tr class="even">
<td>x &gt; y</td>
<td><span class="math inline"><em>x</em> &gt; <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x &gt;= y</td>
<td><span class="math inline"><em>x</em> ≥ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x &lt;= y</td>
<td><span class="math inline"><em>x</em> ≤ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %==% y</td>
<td><span class="math inline"><em>x</em> ≡ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %~~% y</td>
<td><span class="math inline"><em>x</em> ≈ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %=~% y</td>
<td><span class="math inline"><em>x</em> ≅ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %prop% y</td>
<td><span class="math inline"><em>x</em> ∝ <em>y</em></span></td>
</tr>
<tr class="odd">
<td><b>Set&lt;/&gt;</td>
<td></td>
</tr>
<tr class="even">
<td>x %supset% y</td>
<td><span class="math inline"><em>x</em> ⊃ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %supseteq% y</td>
<td><span class="math inline"><em>x</em> ⊇ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %subset% y</td>
<td><span class="math inline"><em>x</em> ⊂ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %notsubset% y</td>
<td><span class="math inline"><em>x</em> ⊄ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %subseteq% y</td>
<td><span class="math inline"><em>x</em> ⊆ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %in% y</td>
<td><span class="math inline"><em>x</em> ∈ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %notin% y</td>
<td><span class="math inline"><em>x</em> ∉ <em>y</em></span></td>
</tr>
<tr class="odd">
<td><b>Arrow</b></td>
<td></td>
</tr>
<tr class="even">
<td>x %&lt;-&gt;% y</td>
<td><span class="math inline"><em>x</em> ↔︎ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %&lt;-% y</td>
<td><span class="math inline"><em>x</em> ← <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %up% y</td>
<td><span class="math inline"><em>x</em> ↑ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %-&gt;% y</td>
<td><span class="math inline"><em>x</em> → <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %down% y</td>
<td><span class="math inline"><em>x</em> ↓ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %&lt;=&gt;% y</td>
<td><span class="math inline"><em>x</em> ⇔ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %&lt;=% y</td>
<td><span class="math inline"><em>x</em> ⇐ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %dblup% y</td>
<td><span class="math inline"><em>x</em> ⇑ <em>y</em></span></td>
</tr>
<tr class="even">
<td>x %=&gt;% y</td>
<td><span class="math inline"><em>x</em> ⇒ <em>y</em></span></td>
</tr>
<tr class="odd">
<td>x %dbldown% y</td>
<td><span class="math inline"><em>x</em> ⇓ <em>y</em></span></td>
</tr>
<tr class="even">
<td><b>Accent</b></td>
<td></td>
</tr>
<tr class="odd">
<td>tilde(x)</td>
<td><span class="math inline"><em>x̃</em></span></td>
</tr>
<tr class="even">
<td>hat(x)</td>
<td><span class="math inline"><em>x̂</em></span></td>
</tr>
<tr class="odd">
<td>widetilde(x)</td>
<td><span class="math inline"><em>x̃</em></span></td>
</tr>
<tr class="even">
<td>widehat(x)</td>
<td><span class="math inline"><em>x̂</em></span></td>
</tr>
<tr class="odd">
<td>bar(x)</td>
<td><span class="math inline"><em>x̄</em></span></td>
</tr>
<tr class="even">
<td><b>Operators</b></td>
<td></td>
</tr>
<tr class="odd">
<td>sum(x[i])</td>
<td><span class="math inline">∑<em>x</em><sub><em>i</em></sub></span>sum(x[i], i==1, n)</td>
</tr>
<tr class="even">
<td>prod(x[i])</td>
<td><span class="math inline">∏<em>x</em><sub><em>i</em></sub></span></td>
</tr>
<tr class="odd">
<td>prod(x[i], i==1, n)</td>
<td><span class="math inline">$\prod_{i = 1}^{n} x_i$</span></td>
</tr>
<tr class="even">
<td>integral(f(x)*{dx}, a, b)</td>
<td><span class="math inline">∫<sub><em>a</em></sub><sup><em>b</em></sup><em>x</em><em>d</em><em>x</em></span></td>
</tr>
<tr class="odd">
<td>union(A[i], i==1, n)</td>
<td><span class="math inline">$\bigcup_{i = 1}^{n} A_i$</span></td>
</tr>
<tr class="even">
<td>intersect(A[i], i==1, n)</td>
<td><span class="math inline">$\bigcup_{i = 1}^{n} A_i$</span></td>
</tr>
<tr class="odd">
<td>lim(f(x), x %-&gt;% infty)</td>
<td><span class="math inline">lim<sub><em>x</em> → ∞</sub><em>x</em></span></td>
</tr>
<tr class="even">
<td>min(f(x), x &gt;= 0)</td>
<td><span class="math inline">min<sub><em>x</em> ≥ 0</sub><em>x</em></span></td>
</tr>
<tr class="odd">
<td>max(f(x), x &gt;= 0)</td>
<td><span class="math inline">max<sub><em>x</em> ≥ 0</sub><em>x</em></span></td>
</tr>
<tr class="even">
<td><b>Typeface</b></td>
<td></td>
</tr>
<tr class="odd">
<td>plain(x)</td>
<td><span class="math inline"><em>x</em></span></td>
</tr>
<tr class="even">
<td>bold(x)</td>
<td><span class="math inline"><strong>x</strong></span></td>
</tr>
<tr class="odd">
<td>italic(x)</td>
<td><span class="math inline"><em>x</em></span></td>
</tr>
<tr class="even">
<td>bolditalic(x)</td>
<td><span class="math inline"><strong>x</strong></span></td>
</tr>
<tr class="odd">
<td><b>Delimiters</b></td>
<td></td>
</tr>
<tr class="even">
<td>group(“(”, list(a,b), “]”)</td>
<td><span class="math inline">(<em>a</em>, <em>b</em>]</span></td>
</tr>
<tr class="odd">
<td>bgroup(“[", frac(a,b), "]”)</td>
<td><span class="math inline">$\left [ \frac{a}{b} \right ]$</span></td>
</tr>
<tr class="even">
<td>abs(x)</td>
<td><span class="math inline">|<em>x</em>|</span></td>
</tr>
</tbody>
</table>

related projects
----------------

-   [equatiomatic](https://github.com/datalorax/equatiomatic)
-   [latex2exp](https://github.com/stefano-meschiari/latex2exp)
-   [textables](https://github.com/setzler/textables)

Acknowledgements
----------------

-   [Hadley Wickham’s book advanced
    R](https://adv-r.hadley.nz/translation.html#latex). Both the idea
    and the code are scratch from this book.
