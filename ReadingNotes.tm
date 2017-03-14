<TeXmacs|1.99.4>

<style|<tuple|book|mathematica>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <doc-data|<doc-title|Wavelet Analysis and Its Application in
  CFD>|<doc-author|<author-data|<author-name|LIU Zeyu>|<\author-affiliation>
    College of Engineering, Peking University<samp|>
  </author-affiliation>>>>

  <part|Mathematical Fundations of Wavelet Analysis>

  <chapter|Basic<rigid|> Concepts of Wavelet Theory>

  <section|An Abstract Way of Introducing Wavelet Theory>

  <subsection|Wavelet>

  In general, the Hilbert space has the property described in the following
  theorem<cite|christensen2010functions>.

  <\theorem>
    <dueto|Existence of orthonormal bases>Every separable Hilbert space
    <name|<samp|<verbatim|>>><math|<with|math-font|cal|H>> has an orthonormal
    basis.
  </theorem>

  Wavelet provides a way of constructing orthonormal bases in
  <math|L<rsup|2><around*|(|\<bbb-R\>|)>> with a spcial structure: all of
  them will be scaled and translated version of a fixed function. The
  character that distinguishes bases with wavelet structure from other
  orthonormal bases in <math|L<rsup|2><around*|(|\<bbb-R\>|)>> is that the
  relevant function can be approximated well by finite partial sums, and even
  with just a few nonzero coefficients.

  <\definition>
    <dueto|Wavelet>Let <math|\<psi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>>.

    <\enumerate-roman>
      <item>For <math|j,k\<in\>\<bbb-Z\>>, define the function
      <math|\<psi\><rsub|j,k>> by

      <\equation*>
        \<psi\><rsub|j,k>\<assign\>2<rsup|j/2>\<psi\><around*|(|2<rsup|j>x-k|)><space|1em>x\<in\>\<bbb-R\>.
      </equation*>

      <item>The function <math|\<psi\>> is called a wavelet if the functions
      <math|<around*|{|\<psi\><rsub|j,k>|}><rsub|j,k\<in\>\<bbb-Z\>>> form an
      orthonormal basis for <math|L<rsup|2><around*|(|\<bbb-R\>|)>>.
    </enumerate-roman>
  </definition>

  In terms of the translation operator <math|T<rsub|k>> and the dilation
  operator <math|D>, we have

  <\equation*>
    \<psi\><rsub|j,k>=D<rsup|j>T<rsub|k>\<psi\><space|1em>j,k\<in\>\<bbb-Z\>.
  </equation*>

  \;

  The systematical theory of constructing wavelet began in middle 1980s, but
  the first wavelet is constructed much earlier and it is proved by Haar in
  1910 that the following function consitutes an example of wavelet.

  <\example>
    <dueto|Haar Function>The <with|font-shape|italic|Haar function> is
    defined by\ 

    <\equation*>
      \<psi\><around*|(|x|)>=<around*|{|<tabular*|<tformat|<twith|table-halign|l>|<cwith|2|2|2|2|cell-halign|l>|<cwith|3|3|2|2|cell-halign|l>|<cwith|1|1|2|2|cell-halign|l>|<table|<row|<cell|1>|<cell|<text|if><space|1em>0\<leqslant\>x\<less\>1/2>>|<row|<cell|-1>|<cell|<text|if><space|1em>1/2\<leqslant\>x\<less\>1>>|<row|<cell|0>|<cell|<text|otherwise.>>>>>>|\<nobracket\>>
    </equation*>
  </example>

  It is very complicated to verify that Haar function is wavelet, and it is
  mentioned here just to point out the existence of wavelet.

  <subsection|Multiresolution Analysis>

  Multiresolution analysis is a general tool to construct wavelet orthonormal
  bases. A multiresolution analysis consists of a collection of conditions on
  certain subspaces of <math|L<rsup|2><around*|(|\<bbb-R\>|)>>, and an
  associated function<math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>>.

  <\definition>
    <dueto|Multiresolution Analysis><label|def:multiresolutionAnalysis>A
    multiresolution analysis for <math|L<rsup|2><around*|(|\<bbb-R\>|)>>
    consists of a squence of closed subspaces
    <math|<around*|{|V<rsub|i>|}><rsub|i\<in\>\<bbb-Z\>>> of
    <math|L<rsup|2><around*|(|\<bbb-R\>|)>> and a function
    <math|\<phi\>\<in\>V<rsub|0>>, such that the following conditions hold:

    <\enumerate-roman>
      <item>The space <math|V<rsub|j>> are nested, i.e.,

      <\equation*>
        \<cdots\>\<subset\>V<rsub|-1>\<subset\>V<rsub|0>\<subset\>V<rsub|1>\<subset\>\<cdots\>.
      </equation*>

      <item><math|<wide|<big|cup><rsub|j\<in\>\<bbb-Z\>>V<rsub|j>|\<bar\>>=L<rsup|2><around*|(|\<bbb-R\>|)>>
      and <math|<big|cap><rsub|j\<in\>\<bbb-Z\>>V<rsub|j>=<around*|{|0|}>.>

      <item><math|\<forall\>j\<in\>\<bbb-Z\>>,
      <math|V<rsub|j+1>=D<around*|(|V<rsub|j>|)>>.

      <item><math|\<forall\>k\<in\>\<bbb-Z\>>,
      <math|f\<in\>V<rsub|0>\<Rightarrow\>T<rsub|k>f\<in\>V<rsub|0>>.

      <item><math|<around*|{|T<rsub|k>\<phi\>|}><rsub|k\<in\>\<bbb-Z\>>> is
      an orthonormal basis for <math|V<rsub|0.>>
    </enumerate-roman>
  </definition>

  A closer look at the condition the condition in Definition
  <reference|def:multiresolutionAnalysis> reveals that the choice of the
  function <math|\<phi\>> in a multiresolution analysis acturally determines
  the space <math|V<rsub|j>> uniquely:

  <\lemma>
    <dueto|The Space <math|V<rsub|j>>><label|lem:spaceVj>Assume that the
    conditions (iii) and (iv) in Definition
    <reference|def:multiresolutionAnalysis> are satisfied. Then the following
    hold:

    <\enumerate-roman>
      <item><math|V<rsub|j>=D<rsup|j><around*|(|V<rsub|0>|)>> for all
      <math|j\<in\>\<bbb-Z\>>.

      <item><math|V<rsub|j>=<wide|span<around*|{|D<rsup|j>T<rsub|k>\<phi\>|}><rsub|k\<in\>\<bbb-Z\>>|\<bar\>>>
      for all <math|j\<in\>\<bbb-Z\>.>
    </enumerate-roman>
  </lemma>

  <\proof>
    For <math|j\<in\>\<bbb-N\>>:

    <\equation*>
      V<rsub|j>=D<around*|(|V<rsub|j-1>|)>=D
      D<around*|(|V<rsub|j-2>|)>=\<cdots\>=D<rsup|j><around*|(|V<rsub|0>|)>,
    </equation*>

    and for <math|j\<less\>0>, (i) holds similarly.

    <\equation>
      V<rsub|j>=D<rsup|j><around*|(|V<rsub|0>|)>=D<rsup|j><around*|(|<wide|span<around*|{|T<rsub|k>\<phi\>|}><rsub|k\<in\>\<bbb-Z\>>|\<bar\>>|)>=<wide|span<around*|{|D<rsup|j>T<rsub|k>\<phi\>|}><rsub|k\<in\>\<bbb-Z\>>|\<bar\>>.<label|Vj>
    </equation>

    \;
  </proof>

  Lemma <reference|lem:spaceVj>(ii) shows that the space <math|V<rsub|j>> in
  a multiresolution analysis are uniquely determined by the function
  <math|\<phi\>>, so we say that the function <math|\<phi\>>
  <with|font-shape|italic|generates the multiresolution analysis>. Later in
  this Chapter, it will shown that only very special function <math|\<phi\> >
  can generate multiresolution analysis.

  <\example>
    <dueto|Haar Multiresolution Analysis>We can define a multiresolution
    analysis by

    <\equation*>
      <around*|{|<tabular|<tformat|<table|<row|<cell|\<phi\>>|<cell|\<assign\>>|<cell|\<chi\><rsub|<around*|[|0,1|)>>;>>|<row|<cell|V<rsub|j>>|<cell|\<assign\>>|<cell|<around*|{|f\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>\<of\>f
      is constant on <around*|[|2<rsup|-j>k,2<rsup|-j><around*|(|k+1|)>|)>,\<forall\>k\<in\>\<bbb-Z\>|}>.>>>>>|\<nobracket\>>
    </equation*>

    Note that the Haar wavelet can be written as

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<psi\><around*|(|x|)>>|<cell|=>|<cell|\<chi\><rsub|<around*|[|0,1/2|)>><around*|(|x|)>-\<chi\><rsub|<around*|[|1/2,1|)>><around*|(|x|)>>>|<row|<cell|>|<cell|=>|<cell|\<chi\><rsub|<around*|[|0,1|)>><around*|(|2x|)>-\<chi\><rsub|<around*|[|0,1|)>><around*|(|2x-1|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|<sqrt|2>><around*|(|D\<chi\><rsub|<around*|[|0,1|)>><around*|(|x|)>-D
      T<rsub|1>\<chi\><rsub|<around*|[|0,1|)>><around*|(|x|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|<sqrt|2>><around*|(|D\<phi\><around*|(|x|)>-D
      T<rsub|1>\<phi\><around*|(|x|)>|)>>>>>
    </eqnarray*>
  </example>

  In order to construct an orthonormal basis for
  <math|L<rsup|2><around*|(|\<bbb-R\>|)>> with multiresolution analysis, we
  need to consider a class of vector space associated with
  {<math|V<rsub|j><around*|}|<rsub|j\<in\>\<bbb-Z\>>|\<nobracket\>>>:

  <\axiom>
    <dueto|The Space <math|W<rsub|j>>>Assume that <math|V<rsub|j>> is a
    sequence of closed subspace of <math|L<rsup|2><around*|(|\<bbb-R\>|)>>
    and that the condition (i) in Definition
    <reference|def:multiresolutionAnalysis> is satisfied. For any
    <math|j\<in\>\<bbb-Z\>>, let <math|W<rsub|j>> denote the orthogonal
    complement of <math|V<rsub|j>> with respect to <math|V<rsub|j+1>>, i.e.,

    <\equation*>
      W<rsub|j>\<assign\><around*|{|f\<in\>V<rsub|j+1><mid|\|><around*|\<langle\>|f,g|\<rangle\>>=0,\<forall\>g\<in\>V<rsub|j>|}>.
    </equation*>

    We denote the orthogonal projection of
    <math|L<rsup|2><around*|(|\<bbb-R\>|)>> onto <math|W<rsub|j>> by
    <math|Q<rsub|j>>.
  </axiom>

  It turns out that the space <math|W<rsub|0>> plays a very special role in
  wavelet analysis. In fact, the next result shows that in order to obtain an
  orthonormal basis <math|<around*|{|D<rsup|j>T<rsub|k>\<psi\>|}><rsub|j,k\<in\>\<bbb-Z\>>>
  for <math|L<rsup|2><around*|(|\<bbb-R\>|)>>, it is enough to find a
  function <math|\<psi\>\<in\>W<rsub|0>> such that
  <math|<around*|{|\<psi\><around*|(|\<cdot\>-k|)>|}><rsub|k\<in\>\<bbb-Z\>>>
  is an orthonormal basis for <math|W<rsub|0.>>

  <\proposition>
    Assume that the function <math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>>
    generates a multiresolution analysis. Let
    <math|\<psi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>> and suppose that
    <math|<around*|{|T<rsub|k>\<psi\>|}><rsub|k\<in\>\<bbb-Z\>>> form an
    orthonormal basis for <math|W<rsub|0>>. Then the following holds:

    <\enumerate-roman>
      <item>For each <math|j\<in\>\<bbb-Z\>>, the functions
      <math|<around*|{|D<rsup|j>T<rsub|k>\<psi\>|}><rsub|k\<in\>\<bbb-Z\>>>
      form an orthonormal basis for <math|W<rsub|j>>.

      <item>The functions <math|<around*|{|D<rsup|j>T<rsub|k>\<psi\>|}><rsub|j,k\<in\>\<bbb-Z\>>>
      form an orthonormal basis for <math|L<rsup|2><around*|(|\<bbb-R\>|)>>,
      i.e., <math|\<psi\>> is a wavelet.

      <item>The functions <math|<around*|{|T<rsub|k>\<phi\>|}><rsub|k\<in\>\<bbb-Z\>>\<cup\><around*|{|D<rsup|j>T<rsub|k>\<psi\>|}><rsub|j\<in\>\<bbb-N\>,k\<in\>\<bbb-Z\>>>
      form an orthonormal basis for <math|L<rsup|2><around*|(|\<bbb-R\>|)>>.<htab|5mm>
    </enumerate-roman>
  </proposition>

  Since function <math|\<psi\>> is a wavelet and function <math|\<phi\>>
  generates the corresponding multiresolution analysis, it is important to
  point out the relationship between the two functions. The following in this
  section also shows the general method of constructing a multiresolution
  analysis.

  <\proposition>
    <dueto|Scaling Function>Assume that the function
    <math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>> generates a
    multiresolution analysis. Then there exists a 1-periodic function
    <math|H<rsub|0>\<in\>L<rsup|2><around*|(|0,1|)>> such that

    <\equation>
      <wide|\<phi\>|^><around*|(|2\<gamma\>|)>=H<rsub|0><around*|(|\<gamma\>|)><wide|\<phi\>|^><around*|(|\<gamma\>|)><label|scalingEquation>
    </equation>
  </proposition>

  Solution to Equation (<reference|scalingEquation>) is called a
  <with|font-shape|italic|scaling function>, or said to be
  <with|font-shape|italic|refinable>. Formulated in this language, a
  necessary condition for a function <math|\<phi\>> to generate a
  multiresolution analysis is that <math|\<phi\>> is a scaling function.
  Later it will be shown that that condition added up with two extra
  conditions can become sufficient. The following theorem provides a concrete
  statement on how to generate a wavelet with Equation
  (<reference|scalingEquation>).

  <\theorem>
    <dueto|Wavelet Orthonormal Basis>Assume that
    <math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>> generates a
    multiresolution analysis, and let <math|H<rsub|0>\<in\>L<rsup|2><around*|(|0,1|)>>
    be a 1-periodic function satisfying the scaling equation
    (<reference|scalingEquation>). Define the 1-periodic function
    <math|H<rsub|1>> by

    <\equation>
      H<rsub|1>\<assign\><wide|H<rsub|0><around*|(|\<gamma\>+<frac|1|2>|)>|\<bar\>>\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>><label|h1>
    </equation>

    Also define the function <math|\<psi\>> via

    <\equation>
      <wide|\<psi\>|^><around*|(|2\<gamma\>|)>\<assign\>H<rsub|1><around*|(|\<gamma\>|)><wide|\<phi\>|^><around*|(|\<gamma\>|)>.<label|psiScaling>
    </equation>

    Then the following holds:

    <\enumerate-roman>
      <item><math|<around*|{|T<rsub|k>\<psi\>|}><rsub|k\<in\>\<bbb-Z\>>> is
      an orthonormal basis for <math|W<rsub|0>>.

      <item><math|<around*|{|D<rsup|j>T<rsub|k>\<psi\>|}><rsub|j,k\<in\>\<bbb-Z\>>>
      is orthonormal basis for <math|L<rsup|2><around*|(|\<bbb-R\>|)>>, i.e.,
      <math|\<psi\>> is a wavelet.
    </enumerate-roman>
  </theorem>

  The direct way of defining the wavelet <math|\<psi\>> is applying inverse
  Fourier transform on <math|<wide|\<psi\>|^><around*|(|\<gamma\>|)>>:

  <\theorem>
    <dueto|Explicit Expression for the Wavelet>Assume that
    (<reference|psiScaling>) holds for a 1-periodic function
    <math|H<rsub|1>\<in\>L<rsup|2><around*|(|0,1|)>>,

    <\equation*>
      H<rsub|1><around*|(|\<gamma\>|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>>d<rsub|k>\<mathe\><rsup|2\<mathpi\>\<mathi\>k\<gamma\>>.
    </equation*>

    Then

    <\equation>
      \<psi\><around*|(|x|)>=<sqrt|2><big|sum><rsub|k\<in\>\<bbb-Z\>>d<rsub|k>D
      T<rsub|-k>\<phi\><around*|(|x|)>=2<big|sum><rsub|k\<in\>\<bbb-Z\>>d<rsub|k>\<phi\><around*|(|2x+k|)><space|1em>x\<in\>\<bbb-R\>.<label|psiScalingExplicit>
    </equation>
  </theorem>

  The Equation (<reference|psiScalingExplicit>) provides the method of
  finding the wavelet <math|\<psi\>> whenever the function <math|H<rsub|0>>
  has been calculated. In most cases of practical interest, <math|H<rsub|0>>
  is actually a trigonometric polynomial:

  <\equation*>
    H<rsub|0><around*|(|\<gamma\>|)>=<big|sum><rsub|k=-N><rsup|N>c<rsub|k>\<mathe\><rsup|2\<mathpi\>\<mathi\>k\<gamma\>>.
  </equation*>

  The explicit expression of the wavelet in (<reference|psiScalingExplicit>)
  immediately leads to a criterion for how to obtain a compactly supported
  wavelet:

  <\corollary>
    <dueto|Compactly Supported Wavelet>Assume that the function
    <math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>> is compactly
    supported and generates a multiresolution analysis. Assume further that
    the function <math|H<rsub|0>> in the scaling equation
    (<reference|scalingEquation>) is a trigonometric polynomial. Then the
    wavelet <math|\<psi\> > in (<reference|psiScalingExplicit>) is compactly
    supported.
  </corollary>

  <\example>
    <dueto|Haar Wavelet>The previous conclusions can all be applied to the
    case of Haar wavelet.
  </example>

  Since a multiresolution analysis is uniquely characterized by the scaling
  function <math|\<phi\>>, it is natural to examine how to formulate the
  multiresolution analysis conditions directly in terms of conditions on the
  function <math|\<phi\>>. Such conditions are:

  <\theorem>
    <dueto|Construction of Multiresolution Analysis>Let
    <math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>>. Define the spaces
    <math|V<rsub|j>> by (<reference|Vj>), and assume that the following
    conditions holds:

    <\enumerate-roman>
      <item><math|inf<rsub|\<gamma\>\<in\><around*|(|-\<varepsilon\>,\<varepsilon\>|)>><around*|\||<wide|\<phi\>|^><around*|(|\<gamma\>|)>|\|>\<gtr\>0>
      for some <math|\<varepsilon\>\<gtr\>0>;

      <item>the scaling equation

      <\equation*>
        <wide|\<phi\>|^><around*|(|2\<gamma\>|)>=H<rsub|0><around*|(|\<gamma\>|)><wide|\<phi\>|^><around*|(|\<gamma\>|)>
      </equation*>

      is satisfied with a bounded 1-periodic function <math|H<rsub|0>>;

      <item><math|<around*|{|T<rsub|k>\<phi\>|}><rsub|k\<in\>\<bbb-Z\>>> form
      an orthonormal system.
    </enumerate-roman>
  </theorem>

  <\theorem>
    <dueto|Characterization of Orthonormal System
    <math|<around*|{|T<rsub|k>\<phi\>|}><rsub|k\<in\>\<bbb-Z\>>>>Let
    <math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>>. Then
    <math|<around*|{|T<rsub|k>\<phi\>|}><rsub|k\<in\>\<bbb-Z\>>> is an
    orthornormal system if and only if

    <\equation*>
      <big|sum><rsub|k\<in\>\<bbb-Z\>><around*|\||<wide|\<phi\>|^><around*|(|\<gamma\>+k|)>|\|><rsup|2>=1<space|1em>\<gamma\>\<in\>\<bbb-R\>
    </equation*>
  </theorem>

  <subsection|Vanishing Moments and Daubechies' Wavelet>

  This section mainly discusses the properties that make wavelet analysis
  useful in signal processing.

  <section|An Elementary Way of Introducing Wavelet Theory>

  This section is mainly according to <cite|WangJizeng2001|williams1994introduction>,
  and provides another way of defining (orthogonal) wavelet which is better
  for programming, but lacks mathematical rigorousness.

  <subsection|Scaling Function>

  The core part of wavelet analysis is the wavelet transform which is a tool
  that split data, function or operator into components with different
  frequency, and then studies the above componet with a resolution matched to
  its scale<cite|williams1994introduction|daubechies1992ten>. The spliting of
  data, function or operator is described mathematically with multiresolution
  of a functional space defined below.

  In order to develop a multilevel representation of a function in
  <math|L<rsup|2 ><around*|(|\<bbb-R\>|)>>, we seek a squence of embedded
  subspaces <math|V<rsub|i>> such that

  <\equation>
    <around*|{|0|}>\<subset\>\<cdots\>\<subset\>V<rsub|-1>\<subset\>V<rsub|0>\<subset\>V<rsub|1>\<subset\>V<rsub|2>\<subset\>\<cdots\>\<subset\>L<rsup|2><around*|(|\<bbb-R\>|)>
  </equation>

  with the following properties:

  <\itemize>
    <item><math|<big|cup><rsub|j\<in\>\<bbb-Z\>>V<rsub|j>> is dense in
    <math|L<rsup|2><around*|(|\<bbb-R\>|)>.>

    <item><math|<big|cap><rsub|j\<in\>\<bbb-Z\>>V<rsub|j>=<around*|{|0|}>.>

    <item>The embedded subspaces are related by a scaling law

    <\equation*>
      g<around*|(|x|)>\<in\>V<rsub|j><space|1em>\<Leftrightarrow\><space|1em>g<around*|(|2x|)>\<in\>V<rsub|j+1>
    </equation*>

    <item>Each subspace is spanned by integer translates of a single function
    <math|g<around*|(|x|)>> such that

    <\equation*>
      g<around*|(|x|)>\<in\>V<rsub|0><space|1em>\<Leftrightarrow\><space|1em>g<around*|(|x+1|)>\<in\>V<rsub|0>
    </equation*>
  </itemize>

  <\definition>
    <dueto|Multiresolution Analysis>If there exists function
    <math|\<phi\><around*|(|x|)>\<in\>V<rsub|0> > such that its integer
    translates <math|<around*|{|\<phi\><around*|(|x-k|)>|}><rsub|k\<in\>\<bbb-Z\>>>
    form a Riesz basis<\footnote>
      Sequence <math|<around*|{|x<rsub|k>|}><rsub|k\<in\>\<bbb-Z\>>> forms a
      Riesz squence of a Hilbert space <math|\<cal-H\>> if there exists
      constants <math|0\<less\>c\<less\>C\<less\>+\<infty\>> such that

      <\equation*>
        c<around*|(|<big|sum><rsub|n><around*|\||a<rsub|n>|\|><rsup|2>|)>\<leqslant\><around*|\<\|\|\>|<big|sum><rsub|n>a<rsub|n>x<rsub|n>|\<\|\|\>><rsup|2>\<leqslant\>C<around*|(|<big|sum><rsub|n><around*|\||a<rsub|n>|\|><rsup|2>|)>
      </equation*>

      for all sequences <math|<around*|{|a<rsub|k>|}><rsub|k\<in\>\<bbb-Z\>>\<subset\>l<rsup|2>>,
      and a Riesz squence <math|<around*|{|x<rsub|k>|}><rsub|k\<in\>\<bbb-Z\>>>
      forms a Riesz basis if

      <\equation*>
        <wide|span<around*|(|x<rsub|k>|)>|\<bar\>>=\<cal-H\>.
      </equation*>

      <\equation*>
        \;
      </equation*>
    </footnote> for the space <math|V<rsub|0>>, then the sequence of
    subspaces <math|<around*|{|V<rsub|j>|}><rsub|j\<in\>\<bbb-Z\>>> forms a
    multiresolution analysis of <math|L<rsup|2><around*|(|\<bbb-R\>|)>>
    space.
  </definition>

  <\definition>
    <dueto|Scaling Function>The function <math|\<phi\><around*|(|x|)>> is
    called scaling function if it produces a multiresolution of
    <math|L<rsup|2><around*|(|\<bbb-R\>|)>.>
  </definition>

  It can be proved that <math|<around*|{||\<nobracket\>>\<phi\><around*|(|2x-k|}><rsub|k\<in\>\<bbb-Z\>>>
  form a basis for the space <math|V<rsub|1>><\footnote>
    Scaling by power other than 2 is also feasible.
  </footnote>. Thus,

  <\eqnarray*>
    <tformat|<table|<row|<cell|V<rsub|0>=>|<cell|<wide|span<around*|{|\<phi\><around*|(|x-k|)>|}><rsub|k\<in\>\<bbb-Z\>>|\<bar\>>>|<cell|>>|<row|<cell|V<rsub|1>=>|<cell|<wide|span<around*|{|\<phi\><around*|(|2x-k|)>|}><rsub|k\<in\>\<bbb-Z\>>|\<bar\>>>|<cell|.>>>>
  </eqnarray*>

  Since <math|V<rsub|0>\<subset\>V<rsub|1>>, we have the following
  <with|font-shape|italic|dilation equation>:

  <\equation>
    \<phi\><around*|(|x|)>=<big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>a<rsub|k>\<phi\><around*|(|2x-k|)>,<space|1em><around*|{|a<rsub|k>|}><rsub|k\<in\>\<bbb-Z\>>\<subset\>l<rsup|2><around*|(|\<bbb-R\>|)>.<label|dilation>
  </equation>

  Similarly we can define

  <\equation>
    \<phi\><rsub|m,k><around*|(|x|)>=2<rsup|m/2>\<phi\><around*|(|2<rsup|m>x-k|)>
  </equation>

  then it can be deduced that <math|<around*|{|\<phi\><rsub|m,k><around*|(|x|)>|}><rsub|k\<in\>\<bbb-Z\>>>
  form a Riesz basis for the space <math|V<rsub|m>>.

  If the integer translates of scaling function
  <math|<around*|{|\<phi\><around*|(|x-k|)>|}><rsub|k\<in\>\<bbb-Z\>>> is
  further constrained as being orthonormal basis of space <math|V<rsub|0>>,
  then we have <math|<around*|{|\<phi\><rsub|m,k><around*|(|x|)>|}><rsub|k\<in\>\<bbb-Z\>>>
  forming an orthonormal basis of space <math|V<rsub|m>>. The dilation
  parameter <math|m> is referred to as the <with|font-shape|italic|scale>.

  <subsection|Wavelet>

  The concept <with|font-shape|italic|wavelet> comes from the difference
  between subspace <math|V<rsub|m-1>> and <math|V<rsub|m>>. The subspace
  <math|W<rsub|m-1>> of <math|L<rsup|2><around*|(|\<bbb-R\>|)>> is defined as
  the orthogonal complement of <math|V<rsub|m-1>> in <math|V<rsub|m>>:

  <\equation>
    V<rsub|m>=V<rsub|m-1>\<oplus\>W<rsub|m-1>.
  </equation>

  It follows that the spaces <math|W<rsub|j>> are orthogonal and that

  <\equation>
    <big|oplus><rsub|j\<in\>\<bbb-Z\>>W<rsub|j>=L<rsup|2><around*|(|\<bbb-R\>|)>.
  </equation>

  <\definition>
    <dueto|Wavelet>Similar to the definition of scaling function to subspace
    <math|V<rsub|0>>, a wavelet function <math|\<psi\><around*|(|x|)>> can be
    introduced such that <math|<around*|{|\<psi\><around*|(|x-k|)>|}><rsub|k\<in\>\<bbb-Z\>>>
    forms a Riesz basis for subspace <math|W<rsub|0>>.Then

    <\equation>
      \<psi\><rsub|m,k><around*|(|x|)>=2<rsup|m/2>\<psi\><around*|(|2<rsup|m>x-k|)><space|1em>m,k\<in\>\<bbb-Z\>
    </equation>

    forming a Riesz basis for subspace <math|W<rsub|m>> is defined as a
    wavelet in <math|L<rsup|2><around*|(|\<bbb-R\>|)>>.
  </definition>

  After defining the multiresolution analysis and wavelet, two projection
  operators can be introduced, assuming that
  <math|<around*|{|\<phi\><rsub|m,k><around*|(|x|)>|}><rsub|k\<in\>\<bbb-Z\>>>
  and <math|<around*|{|\<psi\><rsub|m,k><around*|(|x|)>|}><rsub|k\<in\>\<bbb-Z\>>>
  are both orthonormal basis. We may now approximate a function
  <math|f\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>> by its projection

  <\equation>
    P<rsub|m>f<around*|(|x|)>=<big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>c<rsub|m,k>\<phi\><rsub|m,k><around*|(|x|)>,<label|expansion-pm>
  </equation>

  we may also define projection of function <math|f> on subspace
  <math|W<rsub|m>> as <math|Q<rsub|m>> and it follows that

  <\equation>
    P<rsub|m>=P<rsub|m-1>+Q<rsub|m-1>.<label|pq-relationship>
  </equation>

  This implies that <math|Q<rsub|m>f> is represents the details that was lost
  from one level of approximation to a coarser level.

  The multiresolution analysis defined in a functional way can be explained
  as follows. If we have the expansion coefficients <math|c<rsub|m,k>> in
  equation (<reference|expansion-pm>), then we can decomposes them into two
  parts with equation (<reference|pq-relationship>):

  <\enumerate-numeric>
    <item>the expansion coefficients <math|c<rsub|m-1,k>> of the
    approximation <math|P<rsub|m-1>f>,

    <item>the expansion coefficients <math|d<rsub|m-1,k>> of the detail
    component <math|Q<rsub|m-1>f.>
  </enumerate-numeric>

  <subsection|Example: Haar Wavelet>

  <chapter|Construction and Properties of Wavelet System>

  This chapter is mainly according to <cite|williams1994introduction>.

  <section|The Construction of Daubechies Wavelet System>

  <subsection|Quadrature Mirror Filters>

  In general, a scaling function <math|\<phi\><around*|(|x|)>> is solution to
  dilation equation (<reference|dilation>), and the constants
  <math|a<rsub|k>> are called filter coefficients and it is often the case
  that only a finite number of these are non-zero. Given the filter
  coefficients, the scaling function can be deduced, and the corresponding
  wavelet transform is determined; if certain conditions are imposed on the
  scaling functions, the filter coefficients can be fully derived, and this
  is the most important contribution of modern wavelet theory (along with
  frame theory).

  One of the most important condition on scaling funtion is orthogonality:

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around*|(|x|)>\<phi\><around*|(|x+l|)>
    \<mathd\>x=\<delta\><rsub|0,l><space|1em>l\<in\>\<bbb-Z\>,
  </equation*>

  so a wavelet being orthogonal to the scaling function can defined by:

  <\equation*>
    \<psi\><around*|(|x|)>=<big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>><around*|(|-1|)><rsup|k>a<rsub|N-1-k>\<phi\><around*|(|2x-k|)>
  </equation*>

  where <math|N> is an even integer<\footnote>
    It will then be shown that the wavelet has support over
    <math|<around*|[|0,N-1|]>>.
  </footnote>. The orthogonality is verified as follows:

  <\eqnarray*>
    <tformat|<table|<row|<cell|<around*|\<langle\>|\<phi\><around*|(|x|)>,\<psi\><around*|(|x|)>|\<rangle\>>>|<cell|=>|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>a<rsub|k>\<phi\><around*|(|2x-k|)><big|sum><rsub|l=-\<infty\>><rsup|+\<infty\>><around*|(|-1|)><rsup|l>a<rsub|N-1-l>\<phi\><around*|(|2x-l|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>><around*|(|-1|)><rsup|k>a<rsub|N-1-k>a<rsub|k>>>|<row|<cell|>|<cell|=>|<cell|0.>>>>
  </eqnarray*>

  The set of coefficients <math|<around*|{|a<rsub|k>|}>> and
  <math|<around*|{|<around*|(|-1|)><rsup|k>a<rsub|N-1-k>|}>> are said to form
  a pair of <with|font-shape|italic|quadrature mirror filters>.

  <subsection|Derivation of Filter Coefficients>

  There are several properties that are essential to a useful basis for
  functional analysis which lead to the corresponding conditions constraining
  the filter coefficients. They are listed below:

  <\enumerate-numeric>
    <item>Normalization to unity, i.e.

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|+\<infty\>>\<phi\><around*|(|x|)>\<mathd\>x=1,
    </equation*>

    which leads to

    <\equation>
      <big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>a<rsub|k>=2.<label|normal-cond>
    </equation>

    <item>Orthogonality of scaling function, i.e.

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|+\<infty\>>\<phi\><around*|(|x|)>\<phi\><around*|(|x+l|)>\<mathd\>x=\<delta\><rsub|0,l><space|1em>l\<in\>\<bbb-Z\>,
    </equation*>

    which yields

    <\equation>
      <big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>a<rsub|k>a<rsub|k+2l>=2\<delta\><rsub|0,l><space|1em>l\<in\>\<bbb-Z\>.<label|orthogonal-cond>
    </equation>

    <item>Vanishing moment, i.e.

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|+\<infty\>>\<psi\><around*|(|x|)>x<rsup|l>\<mathd\>x=0<space|1em>l=0,1,2,\<ldots\>,p-1,
    </equation*>

    which yields (by Daubechies <cite|daubechies1992ten>)

    <\equation>
      <big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>><around*|(|-1|)><rsup|k>a<rsub|k>k<rsup|l>=0<space|1em>l=0,1,2,\<ldots\>,<frac*|N|2>-1<label|vanishing-cond>,
    </equation>

    and a more detailed discussion on equation (<reference|vanishing-cond>)
    can be found in <cite|williams1994introduction>.
  </enumerate-numeric>

  The filter coefficients <math|<around*|{|a<rsub|k>|}><rsub|k=0,1,\<ldots\>,N-1>>
  for an N coefficient system are uniquely defined by equation
  (<reference|normal-cond>, <reference|orthogonal-cond>, and
  <reference|vanishing-cond>).

  <subsection|Construction of Scaling Function>

  In general, there is no closed-form solution of scaling function, and they
  have to be attained recursively from the dilation equation
  (<reference|dilation>) instead. In the case of quadrature mirror filter:

  <\equation*>
    \<phi\><around*|(|x|)>=a<rsub|<rsub|0>>\<phi\><around*|(|2x|)>+a<rsub|1>\<phi\><around*|(|2x-1|)>+a<rsub|2>\<phi\><around*|(|2x-2|)>+\<cdots\>+a<rsub|N-1>\<phi\><around*|(|2x-N+1|)>,
  </equation*>

  and it can be proved that<cite|williams1994introduction> all integer points
  outside <math|<around*|[|0,N-1|]>> have zero value, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<phi\><around*|(|0|)>>|<cell|=>|<cell|a<rsub|0>\<phi\><around*|(|0|)>>>|<row|<cell|\<phi\><around*|(|1|)>>|<cell|=>|<cell|a<rsub|0>\<phi\><around*|(|2|)>+a<rsub|1>\<phi\><around*|(|1|)>+a<rsub|2>\<phi\><around*|(|0|)>>>|<row|<cell|\<phi\><around*|(|2|)>>|<cell|=>|<cell|a<rsub|0>\<phi\><around*|(|4|)>+a<rsub|1>\<phi\><around*|(|3|)>+a<rsub|2>\<phi\><around*|(|2|)>+a<rsub|3>\<phi\><around*|(|1|)>+a<rsub|4>\<phi\><around*|(|0|)>>>|<row|<cell|>|<cell|\<vdots\>>|<cell|>>|<row|<cell|\<phi\><around*|(|N-2|)>>|<cell|=>|<cell|a<rsub|N-3>\<phi\><around*|(|N-1|)>+a<rsub|N-2>\<phi\><around*|(|N-2|)>+a<rsub|N-1>\<phi\><around*|(|N-3|)>>>|<row|<cell|\<phi\><around*|(|N-1|)>>|<cell|=>|<cell|a<rsub|N-1>\<phi\><around*|(|N-1|)>.>>>>
  </eqnarray*>

  or

  <\equation*>
    M \<Phi\>=\<Phi\>
  </equation*>

  This linear equation system is actually finding the eigenvector of matrix
  <math|M> corresponding to the eigenvalue <math|1>, so the normalizing
  condition is necessary:

  <\equation*>
    <big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>\<phi\><around*|(|i|)>=1<space|1em>i\<in\>\<bbb-Z\>.
  </equation*>

  \;

  The above process gives the scaling function on integer points, and the
  scaling function on all real points can be calculated by bisection method:

  <\equation*>
    \<phi\><around*|(|<frac|x|2>|)>=<big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>a<rsub|k>\<phi\><around*|(|x-k|)>.
  </equation*>

  <subsection|Example: The Daubechies 4 Coefficient Wavelet System>

  Here we demonstrate the construction of the so called D4 Wavelet. According
  to equation (<reference|normal-cond>, <reference|orthogonal-cond>,
  <reference|vanishing-cond>), we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|a<rsub|0>+a<rsub|1>+a<rsub|2>+a<rsub|3>>|<cell|=>|<cell|2>>|<row|<cell|a<rsub|0><rsup|2>+a<rsub|1><rsup|2>+a<rsub|2><rsup|2>+a<rsub|3><rsup|2>>|<cell|=>|<cell|2>>|<row|<cell|a<rsub|0>-a<rsub|1>+a<rsub|2>-a<rsub|3>>|<cell|=>|<cell|0>>|<row|<cell|-a<rsub|1>+2a<rsub|2>-3a<rsub|3>>|<cell|=>|<cell|0>>>>
  </eqnarray*>

  One set of solution is\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|a<rsub|0>>|<cell|=>|<cell|<frac|1+<sqrt|3>|4>>>|<row|<cell|a<rsub|1>>|<cell|=>|<cell|<frac|3+<sqrt|3>|4>>>|<row|<cell|a<rsub|2>>|<cell|=>|<cell|<frac|3-<sqrt|3>|4>>>|<row|<cell|a<rsub|3>>|<cell|=>|<cell|<frac|1-<sqrt|3>|4>>>>>
  </eqnarray*>

  and the other set of solution is the antithesis of this set leading to
  <math|\<phi\><around*|(|-x|)>> instead of <math|\<phi\><around*|(|x|)>>.

  The values of the scaling function on integer points are given by

  <\equation*>
    <bmatrix|<tformat|<table|<row|<cell|a<rsub|0>-1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|a<rsub|2>>|<cell|a<rsub|1>-1>|<cell|a<rsub|0>>|<cell|0>>|<row|<cell|0>|<cell|a<rsub|3>>|<cell|a<rsub|2>-1>|<cell|a<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|a<rsub|3>-1>>>>><bmatrix|<tformat|<table|<row|<cell|\<phi\><around*|(|0|)>>>|<row|<cell|\<phi\><around*|(|1|)>>>|<row|<cell|\<phi\><around*|(|2|)>>>|<row|<cell|\<phi\><around*|(|3|)>>>>>>=<bmatrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>
  </equation*>

  and solved as:

  <\equation*>
    \<phi\><around*|(|0|)>=0<space|1em>\<phi\><around*|(|1|)>=<frac|1+<sqrt|3>|2><space|1em>\<phi\><around*|(|2|)>=<frac|1-<sqrt|3>|2><space|1em>\<phi\><around*|(|3|)>=0.
  </equation*>

  Additionally we have the half integers:

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<phi\><around*|(|<frac|1|2>|)>>|<cell|=>|<cell|a<rsub|0>\<phi\><around*|(|1|)>=<frac|2+<sqrt|3>|4>>>|<row|<cell|\<phi\><around*|(|<frac|3|2>|)>>|<cell|=>|<cell|a<rsub|1>\<phi\><around*|(|2|)>+a<rsub|2>\<phi\><around*|(|1|)>=0>>|<row|<cell|\<phi\><around*|(|<frac|5|2>|)>>|<cell|=>|<cell|a<rsub|3>\<phi\><around*|(|2|)>=<frac|2-<sqrt|3>|4>.>>>>
  </eqnarray*>

  Any real number point on <math|<around*|[|0,3|]>> can be calculated
  similarly, and it can be verified easily that the scaling function always
  has null value outside <math|<around*|[|0,3|]>>, which means it has compact
  support.

  <section|Classification of Wavelet Bases>

  There are many families of orthogonal wavelets that have been constructed
  in <math|L<rsup|2><around*|(|\<bbb-R\>|)>>. We can classify them with the
  following criteria: localization in physical space (owing to their fast
  decay or even compact support<cite|schneider2010wavelet>), localization in
  frequency space (owing to their vanishing moments and
  smoothness<cite|schneider2010wavelet>), continuity, and differentiablity.

  <section|Mallat Transform>

  The Mallat Transform provides a simple means of transforming data from one
  level of resolution <math|m> to the next coarser level of resolution
  <math|m-1>. The inverse Mallat transform is a transform from the coarser
  level <math|m-1> back to the finer level <math|m>.

  <subsection|Multiresolution Decomposition>

  As is mentioned before, the multiresolution decomposition consists of two
  parts:

  <\enumerate-numeric>
    <item>the expansion coefficients <math|c<rsub|m-1,k>> of the
    approximation <math|P<rsub|m-1>f>,

    <item>the expansion coefficients <math|d<rsub|m-1,k>> of the detail
    component <math|Q<rsub|m-1>f.>
  </enumerate-numeric>

  Consider a function <math|f>:

  <\eqnarray*>
    <tformat|<table|<row|<cell|P<rsub|m>f>|<cell|=>|<cell|<big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>c<rsub|m,k>\<phi\><rsub|m,k><around*|(|x|)><space|1em>c<rsub|m,k>=<around*|\<langle\>|f,\<nospace\>\<phi\><rsub|m,k>|\<rangle\>>>>|<row|<cell|Q<rsub|m>f>|<cell|=>|<cell|<big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>d<rsub|m,k>\<psi\><rsub|m,k><around*|(|x|)><space|1em>d<rsub|m,k>=<around*|\<langle\>|f,\<psi\><rsub|m,k>|\<rangle\>>>>|<row|<cell|P<rsub|m-1>f>|<cell|=>|<cell|P<rsub|m>f-Q<rsub|m-1>f.>>>>
  </eqnarray*>

  Substituting the above in

  <\equation*>
    c<rsub|m-1,k>=<around*|\<langle\>|P<rsub|m-1>f,\<phi\><rsub|m-1,k>|\<rangle\>>
  </equation*>

  leads to the following result

  <\equation>
    c<rsub|m-1,k>=<frac|1|<sqrt|2>><big|sum><rsub|j=-\<infty\>><rsup|+\<infty\>>c<rsub|m,j>a<rsub|j-2k><label|MallatTransC>.
  </equation>

  <\equation*>
    \;
  </equation*>

  Similarly there is:

  <\equation>
    d<rsub|m-1,k>=<frac|1|<sqrt|2>><big|sum><rsub|j=-\<infty\>><rsup|+\<infty\>>c<rsub|m,j><around*|(|-1|)><rsup|<rsup|j>>a<rsub|N-1-j+2k><label|MallatTransD>.
  </equation>

  Equation (<reference|MallatTransC>, <reference|MallatTransD>) form the
  basis of the Mallat transform algorithm.

  <subsection|Multiresolution Reconstruction>

  Multiresolution construction use <math|c<rsub|m-1,k>> and
  <math|d<rsub|m-1,k>> to reconstruct <math|c<rsub|m,k>>. Considering the
  following relationship:

  <\eqnarray*>
    <tformat|<table|<row|<cell|P<rsub|m>f>|<cell|=>|<cell|P<rsub|m-1>f+Q<rsub|m-1>f>>|<row|<cell|c<rsub|m,k>>|<cell|=>|<cell|<around*|\<langle\>|P<rsub|m>f,\<phi\><rsub|m,k>|\<rangle\>>>>>>
  </eqnarray*>

  leads to

  <\equation>
    c<rsub|m,k>=<frac|1|<sqrt|2>><big|sum><rsub|j=-\<infty\>><rsup|+\<infty\>>c<rsub|m-1,j>a<rsub|k-2j>+<frac|1|<sqrt|2>><big|sum><rsub|j=-\<infty\>><rsup|+\<infty\>>d<rsub|m-1,k><around*|(|-1|)><rsup|k>a<rsub|N-1-k+2j><label|InverseMallatTrans>.
  </equation>

  Equation (<reference|InverseMallatTrans>) forms the basis of the inverse
  Mallat transform algorithm.

  <subsection|The Mallat Transform and Inverse Transform Algorithm>

  <chapter|Wavelet Theory in Numerical Analysis>

  <part|Application of Wavelet Analysis in CFD>

  <\bibliography|bib|tm-plain|ReadingNotes.bib>
    <\bib-list|4>
      <bibitem*|1><label|bib-WangJizeng2001>\<#738B\>\<#8BB0\>\<#589E\>.<newblock>
      <with|font-shape|italic|<with|font|uming|\<#6B63\>\<#4EA4\>\<#5C0F\>\<#6CE2\>\<#7EDF\>\<#4E00\>\<#7406\>\<#8BBA\>\<#4E0E\>\<#65B9\>\<#6CD5\>\<#53CA\>\<#5176\>\<#5728\>\<#538B\>\<#7535\>\<#667A\>\<#80FD\>\<#7ED3\>\<#6784\>\<#7B49\>\<#529B\>\<#5B66\>\<#7814\>\<#7A76\>\<#4E2D\>\<#7684\>\<#5E94\>\<#7528\>
      >[D]>.<newblock> <localize|PhD thesis>, 2001.<newblock>

      <bibitem*|2><label|bib-daubechies1992ten>Ingrid Daubechies.<newblock>
      <with|font-shape|italic|Ten lectures on wavelets>.<newblock> SIAM,
      1992.<newblock>

      <bibitem*|3><label|bib-schneider2010wavelet>Kai Schneider<localize| and
      >Oleg<nbsp>V Vasilyev.<newblock> Wavelet methods in computational fluid
      dynamics.<newblock> <with|font-shape|italic|Annual Review of Fluid
      Mechanics>, 42:473\U503, 2010.<newblock>

      <bibitem*|4><label|bib-williams1994introduction>John<nbsp>R
      Williams<localize| and >Kevin Amaratunga.<newblock> Introduction to
      wavelets in engineering.<newblock> <with|font-shape|italic|International
      journal for numerical methods in engineering>, 37(14):2365\U2388,
      1994.<newblock>
    </bib-list>
  </bibliography>

  \ 
</body>

<\initial>
  <\collection>
    <associate|info-flag|detailed>
  </collection>
</initial>

<\attachments>
  <\collection>
    <\associate|bib-bibliography>
      <\db-entry|+cJ9jyZg8Q6HzUJ|phdthesis|WangJizeng2001>
        <db-field|contributor|jacob>

        <db-field|modus|imported>

        <db-field|date|1489210219>
      <|db-entry>
        <db-field|author|<name|<with|font|uming|\<#738B\>\<#8BB0\>\<#589E\>>>>

        <db-field|title|<with|font|uming|\<#6B63\>\<#4EA4\>\<#5C0F\>\<#6CE2\>\<#7EDF\>\<#4E00\>\<#7406\>\<#8BBA\>\<#4E0E\>\<#65B9\>\<#6CD5\>\<#53CA\>\<#5176\>\<#5728\>\<#538B\>\<#7535\>\<#667A\>\<#80FD\>\<#7ED3\>\<#6784\>\<#7B49\>\<#529B\>\<#5B66\>\<#7814\>\<#7A76\>\<#4E2D\>\<#7684\>\<#5E94\>\<#7528\>
        >[D]>

        <db-field|year|2001>
      </db-entry>

      <\db-entry|+cJ9jyZg8Q6HzUK|article|williams1994introduction>
        <db-field|contributor|jacob>

        <db-field|modus|imported>

        <db-field|date|1489210219>
      <|db-entry>
        <db-field|author|John R <name|Williams><name-sep>Kevin
        <name|Amaratunga>>

        <db-field|title|Introduction to wavelets in engineering>

        <db-field|journal|International journal for numerical methods in
        engineering>

        <db-field|year|1994>

        <db-field|volume|37>

        <db-field|number|14>

        <db-field|pages|2365\U2388>

        <db-field|publisher|Wiley Online Library>
      </db-entry>

      <\db-entry|+cJ9jyZg8Q6HzUL|book|daubechies1992ten>
        <db-field|contributor|jacob>

        <db-field|modus|imported>

        <db-field|date|1489210219>
      <|db-entry>
        <db-field|author|Ingrid <name|Daubechies>>

        <db-field|title|Ten lectures on wavelets>

        <db-field|publisher|SIAM>

        <db-field|year|1992>
      </db-entry>

      <\db-entry|+cJ9jyZg8Q6HzUI|article|schneider2010wavelet>
        <db-field|contributor|jacob>

        <db-field|modus|imported>

        <db-field|date|1489210219>
      <|db-entry>
        <db-field|author|Kai <name|Schneider><name-sep>Oleg V
        <name|Vasilyev>>

        <db-field|title|Wavelet methods in computational fluid dynamics>

        <db-field|journal|Annual Review of Fluid Mechanics>

        <db-field|year|2010>

        <db-field|volume|42>

        <db-field|pages|473\U503>

        <db-field|publisher|Annual Reviews>
      </db-entry>
    </associate>
  </collection>
</attachments>

<\references>
  <\collection>
<<<<<<< HEAD
    <associate|Vj|<tuple|1.1|?>>
    <associate|auto-1|<tuple|I|3>>
    <associate|auto-10|<tuple|1.2.3|9>>
    <associate|auto-11|<tuple|2|9>>
    <associate|auto-12|<tuple|2.1|9>>
    <associate|auto-13|<tuple|2.1.1|10>>
    <associate|auto-14|<tuple|2.1.2|10>>
    <associate|auto-15|<tuple|2.1.3|11>>
    <associate|auto-16|<tuple|2.1.4|11>>
    <associate|auto-17|<tuple|2.2|13>>
    <associate|auto-18|<tuple|2.3|15>>
    <associate|auto-19|<tuple|3|17>>
=======
    <associate|InverseMallatTrans|<tuple|2.6|?>>
    <associate|MallatInversTrans|<tuple|2.5|?>>
    <associate|MallatTrans|<tuple|2.4|?>>
    <associate|MallatTransC|<tuple|2.4|?>>
    <associate|MallatTransD|<tuple|2.5|?>>
    <associate|auto-1|<tuple|I|3>>
    <associate|auto-10|<tuple|2.1.1|7>>
    <associate|auto-11|<tuple|2.1.2|7>>
    <associate|auto-12|<tuple|2.1.3|8>>
    <associate|auto-13|<tuple|2.1.4|8>>
    <associate|auto-14|<tuple|2.2|9>>
    <associate|auto-15|<tuple|2.3|9>>
    <associate|auto-16|<tuple|2.3.1|11>>
    <associate|auto-17|<tuple|2.3.2|13>>
    <associate|auto-18|<tuple|2.3.3|15>>
    <associate|auto-19|<tuple|3|?>>
>>>>>>> b40bf0fa8b280652303da510fc623debfd7f3165
    <associate|auto-2|<tuple|1|5>>
    <associate|auto-20|<tuple|II|?>>
    <associate|auto-21|<tuple|II|?>>
    <associate|auto-3|<tuple|1.1|5>>
<<<<<<< HEAD
    <associate|auto-4|<tuple|1.1.1|5>>
    <associate|auto-5|<tuple|1.1.2|5>>
    <associate|auto-6|<tuple|1.1.3|6>>
    <associate|auto-7|<tuple|1.2|7>>
    <associate|auto-8|<tuple|1.2.1|7>>
    <associate|auto-9|<tuple|1.2.2|9>>
    <associate|bib-WangJizeng2001|<tuple|1|17>>
    <associate|bib-daubechies1992ten|<tuple|2|17>>
    <associate|bib-williams1994introduction|<tuple|3|17>>
    <associate|def:multiresolutionAnalysis|<tuple|1.4|?>>
    <associate|dilation|<tuple|1.7|6>>
    <associate|expansion-pm|<tuple|1.12|7>>
    <associate|footnote-1.1|<tuple|1.1|6>>
=======
    <associate|auto-4|<tuple|1.2|5>>
    <associate|auto-5|<tuple|1.2.1|5>>
    <associate|auto-6|<tuple|1.2.2|6>>
    <associate|auto-7|<tuple|1.2.3|6>>
    <associate|auto-8|<tuple|2|7>>
    <associate|auto-9|<tuple|2.1|7>>
    <associate|bib-WangJizeng2001|<tuple|1|15>>
    <associate|bib-daubechies1992ten|<tuple|2|15>>
    <associate|bib-schneider2010wavelet|<tuple|3|?>>
    <associate|bib-williams1994introduction|<tuple|4|15>>
    <associate|dilation|<tuple|1.2|6>>
    <associate|expansion-pm|<tuple|1.7|6>>
    <associate|footnote-1.1|<tuple|1.1|5>>
>>>>>>> b40bf0fa8b280652303da510fc623debfd7f3165
    <associate|footnote-1.2|<tuple|1.2|6>>
    <associate|footnote-2.1|<tuple|2.1|9>>
    <associate|footnr-1.1|<tuple|1.1|6>>
    <associate|footnr-1.2|<tuple|1.2|6>>
    <associate|footnr-2.1|<tuple|2.1|9>>
    <associate|h1|<tuple|1.3|?>>
    <associate|lem:spaceVj|<tuple|1.5|?>>
    <associate|normal-cond|<tuple|2.1|9>>
    <associate|orthogonal-cond|<tuple|2.2|10>>
    <associate|pq-relationship|<tuple|1.13|7>>
    <associate|psiScaling|<tuple|1.4|?>>
    <associate|psiScalingExplicit|<tuple|1.5|?>>
    <associate|scalingEquation|<tuple|1.2|?>>
    <associate|vanishing-cond|<tuple|2.3|10>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      christensen2010functions

      WangJizeng2001

      williams1994introduction

      williams1994introduction

      daubechies1992ten

      williams1994introduction

      daubechies1992ten

      williams1994introduction

      williams1994introduction

      schneider2010wavelet
    </associate>
    <\associate|toc>
      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|I<space|2spc>Mathematical
      Fundations of Wavelet Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Basic<rigid|>
      Concepts of Wavelet Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      1.1<space|2spc>An Abstract Way of Introducing Wavelet Theory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      <with|par-left|<quote|1tab>|1.1.1<space|2spc>Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.1.2<space|2spc>Multiresolution Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      1.2<space|2spc>An Elementary Way of Introducing Wavelet Theory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      <with|par-left|<quote|1tab>|1.2.1<space|2spc>Scaling Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.2.2<space|2spc>Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.2.3<space|2spc>Example: Haar Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Construction
      and Properties of Wavelet System> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      2.1<space|2spc>The Construction of Daubechies Wavelet System
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      <with|par-left|<quote|1tab>|2.1.1<space|2spc>Quadrature Mirror Filters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|2.1.2<space|2spc>Derivation of Filter
      Coefficients <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|2.1.3<space|2spc>Construction of Scaling
      Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|2.1.4<space|2spc>Example: The Daubechies 4
      Coefficient Wavelet System <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      2.2<space|2spc>Classification of Wavelet Bases
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>

      2.3<space|2spc>Mallat Transform <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Wavelet
      Theory in Numerical Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>

      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|II<space|2spc>Application
      of Wavelet Analysis in CFD> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>