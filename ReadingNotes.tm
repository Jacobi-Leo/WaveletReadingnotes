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

  <prologue>

  The concept of wavelet is originated from Fourier analysis. The classical
  Fourier transform

  <\equation>
    <wide|f|^><around*|(|\<gamma\>|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>f<around*|(|x|)>\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>x>\<mathd\>x<label|FourierTrans>
  </equation>

  converts information to the <with|font-shape|italic|frequency space>.
  However, the Fourier transform is not localized in both physical space and
  frequency space. One method of obtain local information on physical space
  of a signal is the Fourier transform with a windowed function
  <math|g<around*|(|t-b|)>>:

  <\equation*>
    <around*|(|G<rsub|a,b>f|)><around*|(|\<gamma\>|)>\<assign\><big|int><rsub|-\<infty\>><rsup|+\<infty\>>f<around*|(|t|)>e<rsup|-2\<mathpi\>\<mathi\>\<gamma\>x>g<rsub|a><around*|(|t-b|)>\<mathd\>t
  </equation*>

  where

  <\equation*>
    g<rsub|a><around*|(|x|)>\<assign\>\<mathe\><rsup|-2\<mathpi\>a
    x<rsup|2>>.
  </equation*>

  The above transform is also called <with|font-shape|italic|Gabor
  transform>. The shortcoming of Gabor transform is that it has only fixed
  window, so it is not suitable for signals with singularity or severe
  oscillation. Inspired by the above methods, wavelet transform provides a
  systematical tool of analyzing unstable signals.

  <part|Mathematical Foundations of Wavelet Analysis>

  <chapter|Basic<rigid|> Concepts of Wavelet>

  <section|An Abstract Way of Introducing Discrete Wavelet Transform>

  <subsection|Wavelet>

  In general, the Hilbert space has the property described in the following
  theorem:<cite|christensen2010functions>

  <\theorem>
    <dueto|Existence of orthonormal bases>Every separable Hilbert space
    <name|<samp|<verbatim|>>><math|<with|math-font|cal|H>> has an orthonormal
    basis.
  </theorem>

  Discrete wavelet transform provides a way of constructing orthonormal bases
  in <math|L<rsup|2><around*|(|\<bbb-R\>|)>> with a special structure: all of
  them are scaled and translated version of a fixed function. The character
  that distinguishes bases with wavelet structure from other orthonormal
  bases in <math|L<rsup|2><around*|(|\<bbb-R\>|)>> is that the relevant
  function can be approximated well by finite partial sums, and even with
  just a few nonzero coefficients.

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
  1910 that the following function consistutes an example of wavelet.

  <\example>
    <dueto|Haar Function>The <with|font-shape|italic|Haar function> is
    defined by <\equation*>
      \<psi\><around*|(|x|)>=<around*|{|<tabular*|<tformat|<twith|table-halign|l>|<cwith|2|2|2|2|cell-halign|l>|<cwith|3|3|2|2|cell-halign|l>|<cwith|1|1|2|2|cell-halign|l>|<table|<row|<cell|1>|<cell|<text|if><space|1em>0\<leqslant\>x\<less\>1/2>>|<row|<cell|-1>|<cell|<text|if><space|1em>1/2\<leqslant\>x\<less\>1>>|<row|<cell|0>|<cell|<text|otherwise.>>>>>>|\<nobracket\>>
    </equation*>
  </example>

  It is very complicated to verify that Haar function is wavelet, and it is
  mentioned here just to point out the existence of wavelet, and an
  illustration on how Haar function forms a wavelet is in Section
  <reference|sec:haarWavelet>.

  <subsection|Multiresolution Analysis>

  Multiresolution analysis is a general tool to construct wavelet orthonormal
  bases. A multiresolution analysis consists of a collection of conditions on
  certain subspaces of <math|L<rsup|2><around*|(|\<bbb-R\>|)>>, and an
  associated function <math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>>.

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
    <label|eg:haarMRA><dueto|Haar Multiresolution Analysis>We can define a
    multiresolution analysis by

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
  need to consider a class of vector space <math|W<rsub|j>> associated with
  {<math|V<rsub|j><around*|}|<rsub|j\<in\>\<bbb-Z\>>|\<nobracket\>>>:

  <\definition>
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
  </definition>

  The above construction of space <math|W<rsub|j>> is very similar to
  Gram-Schmidt process in finite-dimensional linear algebra. However, in
  infinite-dimensional vector spaces, the Gram-Schmidt process does not make
  sense in general. The multiresolution analysis provides a special condition
  with which a process similar to Gram-Schmidt process is feasible.

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
    <dueto|Wavelet Orthonormal Basis><label|thm:constructionWavelet>Assume
    that <math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>> generates a
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
    <dueto|Construction of Multiresolution
    Analysis><label|thm:constructionMRA>Let
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
  useful in signal processing, and the construction by Ingrid Daubechies.

  Since the functions <math|<around*|{|T<rsub|k>\<phi\>|}><rsub|k\<in\>\<bbb-Z\>>\<cup\><around*|{|D<rsup|j>T<rsub|k>\<psi\>|}><rsub|j\<in\>\<bbb-N\>,k\<in\>\<bbb-Z\>>>
  form an orthonormal basis for <math|L<rsup|2><around*|(|\<bbb-R\>|)>>, we
  know that any <math|f\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>> has the
  representation

  <\equation>
    f=<big|sum><rsub|k\<in\>\<bbb-Z\>><around*|\<langle\>|f,T<rsub|k>\<phi\>|\<rangle\>>T<rsub|k>\<phi\>+<big|sum><rsub|j=1><rsup|\<infty\>><big|sum><rsub|k\<in\>\<bbb-Z\>><around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>\<psi\><rsub|j,k>.<label|representation>
  </equation>

  All information about the function <math|f> is stored in the coefficients

  <\equation*>
    <around*|{|<around*|\<langle\>|f,T<rsub|k>\<phi\>|\<rangle\>>|}><rsub|k\<in\>\<bbb-Z\>><rsup|>*\<cup\><around*|{|<around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>|}><rsub|j\<in\>\<bbb-N\>,k\<in\>\<bbb-Z\>>.
  </equation*>

  However, in practice computers can only process finite sequence, so one has
  to select a finite number of coefficients to keep. In most situation of
  practical interest, such as the wavelet generated by a compactly supported
  scaling function <math|\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>>, the
  sequence <math|><math|<around*|{|<around*|\<langle\>|f,T<rsub|k>\<phi\>|\<rangle\>>|}><rsub|k\<in\>\<bbb-Z\>>>
  is actually finite, thus the problems is how to deal with the infinite
  sequence <math|<around*|{|<around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>|}><rsub|j\<in\>\<bbb-N\>,k\<in\>\<bbb-Z\>>>.
  This is usually done by <with|font-shape|italic|thresholding><cite|schneider2010wavelet>:
  we choose a certain <math|\<varepsilon\>\<gtr\>0> and keep only the
  coefficients in (<reference|representation>) under condition:

  <\equation>
    <around*|\||<around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>|\|>\<geqslant\>\<varepsilon\>.<label|thresholdingCondition>
  </equation>

  By convergence of (<reference|representation>) the coefficients
  <math|<around*|{|<around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>|}><rsub|j,k\<in\>\<bbb-Z\>>\<subset\>\<ell\><rsup|2>>,
  so only finite number of indices <math|<around*|(|j,k|)>\<in\>\<bbb-Z\>\<times\>\<bbb-Z\>>
  satisfy (<reference|thresholdingCondition>). A key feature of wavelet
  theory is that it is often posible to choose the wavelet <math|\<psi\>>
  such that many of the coefficients <math|<around*|{|<around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>|}><rsub|j\<in\>\<bbb-N\>,k\<in\>\<bbb-Z\>>>
  are small.

  <\example>
    <dueto|Haar Wavelet>For Haar wavelet, we have
    (<reference|representation>) as

    <\equation*>
      <around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>\<psi\><rsub|j,k><around*|(|x|)>=2<rsup|j/2><around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>\<psi\><around*|(|2<rsup|j>x-k|)>,
    </equation*>

    and it can be shown that

    <\eqnarray*>
      <tformat|<table|<row|<cell|d<rsub|j,k>>|<cell|\<assign\>>|<cell|2<rsup|j/2><around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><around*|(|average
      of f over<around*|[|2<rsup|-j>k,2<rsup|-j><around*|(|k+1/2|)>|)>-average
      of f over <around*|[|2<rsup|-j><around*|(|k+1/2|)>,2<rsup|-j><around*|(||\<nobracket\>>k+1|)>|)>.>>>>
    </eqnarray*>

    Since

    <\equation*>
      <around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>=2<rsup|-j/2>d<rsub|j,k><space|1em>j\<geqslant\>1<space|1em>k\<in\>\<bbb-Z\>,
    </equation*>

    most coefficients in (<reference|representation>) are very small if
    <math|f> is continuous or oscillates slightly.
  </example>

  In order to find wavelets that are better than Haar wavelet, we need to
  introduce <with|font-shape|italic|vanishing moment> first.

  <\definition>
    <dueto|Vanishing Moment>Let <math|N\<in\>\<bbb-N\>>. A function
    <math|\<psi\>> has <math|N> vanishing moments if

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|+\<infty\>>x<rsup|\<ell\>>\<psi\><around*|(|x|)>\<mathd\>x=0<space|1em>for
      \<ell\>=0,1,\<ldots\>,N-1.
    </equation*>
  </definition>

  The Haar wavelet has only one vanishing moment. We have the following
  result showing that only relatively few coefficients
  <math|<around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>> will be large if
  <math|\<psi\>> has a large number of vanishing moments.

  <\theorem>
    <dueto|Decay of Wavelet Coefficients><label|thm:decay>Assume that the
    function <math|\<psi\>\<in\>L<rsup|2><around*|(|\<bbb-R\>|)> > is
    compactly supported and has <math|N> vanishing moments. Then, for any
    <math|N>times differentiable function
    <math|f\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>> for which the <math|N>th
    derivative <math|f<rsup|<around*|(|N|)>>> is bounded, there exists a
    constant <math|C\<gtr\>0> such that

    <\equation>
      <around*|\||<around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>|\|>\<leqslant\>C2<rsup|-j
      N>2<rsup|-j/2><space|1em>\<forall\>j\<geqslant\>1<space|1em>k\<in\>\<bbb-Z\><label|basicEstimate>
    </equation>
  </theorem>

  The proof of Theorem (<reference|thm:decay>) is complicated
  <cite|walnut2013introduction>, but the result shows clearly that: the
  higher number of vanishing moments a wavelet has, the fewer coefficients
  <math|<around*|{|<around*|\<langle\>|f,\<psi\><rsub|j,k>|\<rangle\>>|}><rsub|j\<in\>\<bbb-N\>,k\<in\>\<bbb-Z\>>>
  remain after thresholding. Another import theorem is provided by
  <cite|walnut2013introduction>:

  <\theorem>
    <dueto|Vanishing Moment><label|thm:vanishingMoment>Let <math|\<phi\>> be
    a compactly supported scaling function associated with a multiresolution
    analysis, and let <math|\<psi\>> be the associated wavelet as in
    (<reference|scalingEquation>). Then the following are equivalent:

    <\enumerate-roman>
      <item><math|\<psi\>> has <math|N> vanishing moments.

      <item>The function <math|H<rsub|0>> can be factorized

      <\equation>
        H<rsub|0><around*|(|\<gamma\>|)>=<around*|(|<frac|1+\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>>|2>|)><rsup|N>L<around*|(|\<gamma\>|)><label|vanishingMomentH>
      </equation>

      for some 1-periodic trigonometric polynomial <math|L>.
    </enumerate-roman>
  </theorem>

  Combining Theorem (<reference|thm:constructionMRA>) and Theorem
  (<reference|thm:vanishingMoment>) produces one approach to construct a
  wavelet <math|\<psi\>> having <math|N> vanishing moments by searching for a
  proper 1-periodic function <math|H<rsub|0>\<in\>L<rsup|2><around*|(|0,1|)>>.
  Then

  <\equation*>
    <wide|\<phi\>|^><around*|(|\<gamma\>|)>=H<rsub|0><around*|(|\<gamma\>/2|)><wide|\<phi\>|^><around*|(|\<gamma\>/2|)>=H<rsub|0><around*|(|\<gamma\>/2|)>H<rsub|0><around*|(|\<gamma\>/4|)><wide|\<phi\>|^><around*|(|\<gamma\>/4|)>=H<rsub|0><around*|(|\<gamma\>/2|)>H<rsub|0><around*|(|\<gamma\>/4|)>H<rsub|0><around*|(|\<gamma\>/8|)><wide|\<phi\>|^><around*|(|\<gamma\>/8|)>,
  </equation*>

  and finally for any <math|K\<in\>\<bbb-N\>>

  <\equation*>
    <wide|\<phi\>|^><around*|(|\<gamma\>|)>=H<rsub|0><around*|(|\<gamma\>/2|)>H<rsub|0><around*|(|\<gamma\>/4|)>H<rsub|0><around*|(|\<gamma\>/8|)>\<cdots\>H<rsub|0><around*|(|\<gamma\>/2<rsup|K>|)><wide|\<phi\>|^><around*|(|\<gamma\>/2<rsup|K>|)>=<wide|\<phi\>|^><around*|(|\<gamma\>/2<rsup|K>|)><big|prod><rsub|j=1><rsup|K>H<rsub|0><around*|(|\<gamma\>/2<rsup|j>|)>.
  </equation*>

  It can be proved that the following limit process is feasible

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|\<phi\>|^><around*|(|\<gamma\>|)>>|<cell|=>|<cell|lim<rsub|K\<rightarrow\>\<infty\>><around*|(|<wide|\<phi\>|^><around*|(|\<gamma\>/2<rsup|K>|)><big|prod><rsub|j=1><rsup|K>H<rsub|0><around*|(|\<gamma\>/2<rsup|j>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<wide|\<phi\>|^><around*|(|0|)><big|prod><rsub|j=1><rsup|\<infty\>>H<rsub|0><around*|(|\<gamma\>/2<rsup|j>|)>.>>>>
  </eqnarray*>

  This also ensures the uniqueness (up to a scalar multiplication) of scaling
  function <math|\<phi\>> since once <math|<wide|\<phi\>|^><around*|(|0|)>>
  is given, all other values are determined.

  The <with|font-shape|italic|Daubechies' wavelets> are the best known
  constructions based on the above idea. First denote
  <math|P<rsub|N-1>,N\<in\>\<bbb-N\>> by

  <\equation*>
    P<rsub|N-1><around*|(|y|)>=<big|sum><rsub|k=0><rsup|N-1><frac|<around*|(|2N-1|)>!|k!<around*|(|2N-1-k|)>!>y<rsup|k><around*|(|1-y|)><rsup|N-1-k>,
  </equation*>

  then <cite|daubechies1992ten> provides another important theorem:

  <\theorem>
    <dueto|Daubechies' Wavelets>For any <math|N\<in\>\<bbb-N\>>, there exists
    a trigonometric polynomial <math|L> such that

    <\equation>
      <around*|\||L<around*|(|\<gamma\>|)>|\|><rsup|2>=P<rsub|N-1><around*|(|sin<rsup|2>\<mathpi\>\<gamma\>|)>.<label|daubechiesL>
    </equation>

    With such a choice for <math|L>, the following hold:

    <\enumerate-roman>
      <item>The function <math|H<rsub|0>> given by
      (<reference|vanishingMomentH>) is associated with a multiresolution
      analysis.

      <item>With <math|H<rsub|0>> as in (i), the wavelet <math|\<psi\>> given
      in Theorem <reference|thm:constructionWavelet> has <math|N> vanishing
      moments, and support in <math|<around*|[|0,2N-1|]>.>
    </enumerate-roman>
  </theorem>

  <\example>
    <dueto|The Polynomial <math|P<rsub|N-1>>>It can be calculated that:

    <\eqnarray*>
      <tformat|<table|<row|<cell|P<rsub|0><around*|(|y|)>>|<cell|=>|<cell|1>>|<row|<cell|P<rsub|1><around*|(|y|)>>|<cell|=>|<cell|1+2y>>|<row|<cell|P<rsub|2><around*|(|y|)>>|<cell|=>|<cell|1+3y+6y<rsup|2>>>>>
    </eqnarray*>
  </example>

  Daubechies further provides a procedure called
  <with|font-shape|italic|spectral factorization> to find the trigonometric
  polynomial <math|L> satisfying (<reference|daubechiesL>).

  <\example>
    <dueto|Spectral Factorization with <math|N=1>>For <math|N=1>,
    <math|<around*|\||L<around*|(|\<gamma\>|)>|\|><rsup|2>=1>, which is
    satisfied for <math|L<around*|(|\<gamma\>|)>=-1>. Via
    (<reference|vanishingMomentH>), this leads to

    <\equation*>
      H<rsub|0><around*|(|\<gamma\>|)>=<frac|1+\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>>|2>L<around*|(|\<gamma\>|)>=<frac|-1-\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>>|2>.
    </equation*>

    We can calculate <math|H<rsub|1>>:

    <\eqnarray*>
      <tformat|<table|<row|<cell|H<rsub|1><around*|(|\<gamma\>|)>>|<cell|=>|<cell|<wide|H<rsub|0><around*|(|\<gamma\>+<frac|1|2>|)>|\<bar\>>\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>>>>|<row|<cell|>|<cell|=>|<cell|<wide|<frac|-1-\<mathe\><rsup|-2\<mathpi\>\<mathi\><around*|(|\<gamma\>+1/2|)>>|2>|\<bar\>>\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1-\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>>|2>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|k=-1><rsup|0>d<rsub|k>\<mathe\><rsup|2\<mathpi\>\<mathi\>k
      x>,>>>>
    </eqnarray*>

    where <math|d<rsub|0>=1/2,d<rsub|-1>=-1/2>. By
    (<reference|psiScalingExplicit>), the associated wavelet is

    <\equation*>
      \<psi\><around*|(|x|)>=<sqrt|2><big|sum><rsub|k=-1><rsup|0>d<rsub|k> D
      T<rsub|-k>\<phi\><around*|(|x|)>=\<phi\><around*|(|2x|)>-\<phi\><around*|(|2x-1|)>
      ,
    </equation*>

    which is exactly the expression for the Haar wavelet in Example
    <reference|eg:haarMRA>.
  </example>

  <section|An Elementary Way of Introducing Wavelet>

  This section is mainly according to <cite|WangJizeng2001|williams1994introduction>,
  and provides another way of defining (orthogonal) wavelet which is better
  for programming, but lacks mathematical rigorousness.

  <subsection|Example: Haar Wavelet>

  <label|haarWavelet>This section is an demonstration on how to approximate
  an arbitrary function <math|f> in <math|L<rsup|2><around*|(|\<bbb-R\>|)>>
  by linear combination of Haar wavelet <cite|daubechies1992ten>. First, any
  function <math|f\<in\>L<rsup|2><around*|(|\<bbb-R\>|)>> can be arbitrarily
  well approximated by a function with compact support which is piecewise
  constant on the interval <math|<around*|[|\<ell\>2<rsup|-j>,<around*|(|\<ell\>+1|)>2<rsup|-j>|)>>
  (it suffices to take the support and <math|j> large enough). As a result,
  we consider the following piecewise constant function: assume <math|f> to
  be supported on <math|<around*|[|-2<rsup|J<rsub|1>>,2<rsup|J<rsub|1>>|]>>,
  and to be piecewise constant on <math|<around*|[|\<ell\>2<rsup|-J<rsub|0>>,<around*|(|\<ell\>+1|)>2<rsup|-J<rsub|0>>|)>>,
  as is shown in Figure <reference|fig:blowup>. Let us define the function
  <math|f<rsup|0>=f>, and denote the constant value of <math|f<rsup|0>> on
  <math|<around*|[|\<ell\>2<rsup|-J<rsub|0>>,<around*|(|\<ell\>+1|)>2<rsup|-J<rsub|0>>|)>>
  by <math|f<rsup|0><rsub|\<ell\>>>. We now represent function
  <math|f<rsup|0>> as a sum of two parts,
  <math|f<rsup|0>=f<rsup|1>+\<delta\><rsup|1>>, where the function
  <math|f<rsup|1>> is an approximation to <math|f<rsup|0>> which is piecewise
  constant over intervals twice as large as the originally, i.e.,

  <\equation*>
    f<rsup|1>\|<rsub|<around*|[|k2<rsup|-J<rsub|0>+1>,<around*|(|k+1|)>2<rsup|-J<rsub|0>+1>|)>>\<assign\>constant=f<rsub|k><rsup|1>
    .
  </equation*>

  And the values of <math|f<rsup|1>> is given by the average of function
  <math|f<rsup|0>>. Now we can write down that:

  <\equation>
    f<rsub|k><rsup|1>=<frac|1|2><around*|(|f<rsub|2k><rsup|0>+f<rsub|2k+1><rsup|0>|)>
    .
  </equation>

  The function <math|\<delta\><rsup|1>> is piecewise constant with the same
  stepwidth as <math|f<rsup|0>>, and we have:

  <\equation>
    \<delta\><rsub|2\<ell\>><rsup|1>=f<rsub|2\<ell\>><rsup|0>-f<rsub|\<ell\>><rsup|1>=<frac|1|2><around*|(|f<rsub|2\<ell\>><rsup|0>-f<rsub|2\<ell\>+1><rsup|0>|)>
  </equation>

  and

  <\equation>
    \<delta\><rsub|2\<ell\>+1><rsup|1>=f<rsub|2\<ell\>+1><rsup|0>-f<rsub|\<ell\>><rsup|1>=<frac|1|2><around*|(|f<rsub|2\<ell\>+1><rsup|0>-f<rsub|2\<ell\><rsup|>><rsup|0>|)>=-\<delta\><rsub|2\<ell\>><rsup|1>
    .
  </equation>

  So on interval <math|<around*|[|k2<rsup|-J<rsub|0>+1>,<around*|(|k+1|)>2<rsup|-J<rsub|0>+1>|)>>,
  we have that

  <\equation*>
    \<delta\><rsup|1><around*|(|x|)>=\<delta\><rsub|2l><rsup|1>
    \<psi\><around*|(|2<rsup|J<rsub|0>-1>x-\<ell\>|)> ,
  </equation*>

  hence

  <\equation>
    \<delta\><rsup|1><around*|(|x|)>=<big|sum><rsub|\<ell\>=-2<rsup|J<rsub|1>+J<rsub|0>>+1><rsup|2<rsup|J<rsub|1>+J<rsub|0>>-1>\<delta\><rsup|1><rsub|2\<ell\>>
    \<psi\><around*|(|2<rsup|J<rsub|0>-1>-\<ell\>|)> .
  </equation>

  Now we have written <math|f> as

  <\equation*>
    f=f<rsup|0>=f<rsup|1>+<big|sum><rsub|l>c<rsub|-J<rsub|0>+1,\<ell\>>
    \<psi\><rsub|-J<rsub|0>+1,\<ell\>> ,
  </equation*>

  where <math|f<rsup|1>> is the same type of function as <math|f<rsup|0>> but
  with stepwidth twice as large.

  <big-figure|<image|Figures/HaarWavelet.png|540px|604px||>|<label|fig:blowup>(upper)
  A function <math|f> with support <math|<around*|[|-2<rsup|J<rsub|1>>,2<rsup|J<rsub|1>>|]>>,
  piecewise constant on the <math|<around*|[|\<ell\>2<rsup|-J<rsub|0>>,<around*|(|\<ell\>+1|)>2<rsup|-J<rsub|0>>|)>.>
  (lower) A blowup of a portion of <math|f>.>

  We can apply the same trick to <math|f<rsup|1>>, so that

  <\equation*>
    f<rsup|1>=f<rsup|2>+<big|sum><rsub|l>c<rsub|-J<rsub|0>+2,\<ell\> >
    \<psi\><rsub|-J<rsub|0>+2,\<ell\>> .
  </equation*>

  We keep going the trick until we have

  <\equation*>
    f=f<rsup|J<rsub|0>+J<rsub|1>>+<big|sum><rsub|m=-J<rsub|0>+1><rsup|J<rsub|1>><big|sum><rsub|\<ell\>>c<rsub|m,\<ell\>>
    \<psi\><rsub|m,\<ell\>> .
  </equation*>

  Here <math|f<rsup|J<rsub|0>+J<rsub|1>>> consists of two constant pieces
  (see Figure <reference|fig:haarWavelet2>).

  <\big-figure>
    <image|Figures/HaarWavelet2.png|278px|202px||>
  </big-figure|<label|fig:haarWavelet2>Extending interval
  <math|<around*|[|-2<rsup|J<rsub|1>>,2<rsup|J<rsub|1>>|]>> to
  <math|<around*|[|-2<rsup|J<rsub|1>+1>,2<rsup|J<rsub|1>+1>|]>>.>

  As is shown in Figure <reference|fig:haarWavelet2>, the interval can be
  extended to twice larger, which means the support of function <math|f> is
  extended:

  <\equation*>
    f=f<rsup|J<rsub|0>+J<rsub|1>+K>+<big|sum><rsub|m=-J<rsub|0>+1><rsup|J<rsub|1>+K><big|sum><rsub|\<ell\>>c<rsub|m,\<ell\>>
    \<psi\><rsub|m,\<ell\>> .
  </equation*>

  It follows immediately that

  <\eqnarray*>
    <tformat|<table|<row|<cell|<around*|\<\|\|\>|f-<big|sum><rsub|m=-J<rsub|0>+1><rsup|J<rsub|1>+K><big|sum><rsub|\<ell\>>c<rsub|m,\<ell\>>
    \<psi\><rsub|m,\<ell\>>|\<\|\|\>><rsub|L<rsup|2>><rsup|2>>|<cell|=>|<cell|<around*|\<\|\|\>|f<rsup|J<rsub|0>+J<rsub|1>+K>|\<\|\|\>><rsub|L<rsup|2>><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|2<rsup|-K/2>\<cdot\>2<rsup|J<rsub|1>/2><around*|(|<around*|\||f<rsub|0><rsup|J<rsub|0>+J<rsub|1>>|\|><rsup|2>+<around*|\||f<rsub|-1><rsup|J<rsub|0>+J<rsub|1>>|\|><rsup|2>|)><rsup|1/2>,>>>>
  </eqnarray*>

  which can be arbitrarily small by taking sufficiently large <math|K>.
  Finally, this illustrates that <math|f> can be approximated to arbitrary
  precision by a finite linear combination of Haar wavelets.

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

  <chapter|Construction and Properties of Wavelet
  System><label|chap:ConstructionWaveletSystem>

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

  One of the most important condition on scaling function is orthogonality:

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

  One set of solution is <\eqnarray*>
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

  The equations (<reference|MallatTransC>, <reference|MallatTransD>, and
  <reference|InverseMallatTrans>) is expressed by the following algorithm.
  Consider a string of data <math|c<rsub|m,k>> of finite length <math|n>
  which represents the approximation <math|P<rsub|m>f> to a function. For
  convenience, suppose that this data is periodic with period <math|n>. The
  matrix form of equation (<reference|MallatTransC>) is

  <\equation*>
    <bmatrix|<tformat|<table|<row|<cell|c<rsub|m-1,0>>>|<row|<cell|\<times\>>>|<row|<cell|c<rsub|m-1,1>>>|<row|<cell|\<times\>>>|<row|<cell|c<rsub|m-1,2>>>|<row|<cell|\<times\>>>|<row|<cell|\<cdots\>>>|<row|<cell|\<cdots\>>>|<row|<cell|c<rsub|m-1,n/2-1>>>|<row|<cell|\<times\>>>>>>=<frac|1|<sqrt|2>><bmatrix|<tformat|<table|<row|<cell|a<rsub|0>>|<cell|a<rsub|1>>|<cell|a<rsub|2>>|<cell|a<rsub|3>>|<cell|\<cdots\>>|<cell|a<rsub|N-1>>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|0>|<cell|a<rsub|0>>|<cell|a<rsub|1>>|<cell|a<rsub|2>>|<cell|\<cdots\>>|<cell|a<rsub|N-2>>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|a<rsub|0>>|<cell|a<rsub|1>>|<cell|\<cdots\>>|<cell|a<rsub|N-3>>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|a<rsub|0>>|<cell|\<cdots\>>|<cell|a<rsub|N-4>>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|0>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|a<rsub|N-1>>>|<row|<cell|a<rsub|N-1>>|<cell|0>|<cell|0>|<cell|0>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|a<rsub|N-2>>>|<row|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>>|<row|<cell|a<rsub|2>>|<cell|a<rsub|3>>|<cell|a<rsub|4>>|<cell|a<rsub|5>>|<cell|\<cdots\>>|<cell|0>|<cell|\<cdots\>>|<cell|a<rsub|1>>>|<row|<cell|a<rsub|1>>|<cell|a<rsub|2>>|<cell|a<rsub|3>>|<cell|a<rsub|4>>|<cell|\<cdots\>>|<cell|0>|<cell|\<cdots\>>|<cell|a<rsub|0>>>>>><bmatrix|<tformat|<table|<row|<cell|c<rsub|m,0>>>|<row|<cell|c<rsub|m,1>>>|<row|<cell|c<rsub|m,2>>>|<row|<cell|c<rsub|m,3>>>|<row|<cell|\<cdots\>>>|<row|<cell|\<cdots\>>>|<row|<cell|\<cdots\>>>|<row|<cell|\<cdots\>>>|<row|<cell|c<rsub|m,n-2>>>|<row|<cell|c<rsub|m,n-1>>>>>>
  </equation*>

  in which <math|\<times\>> represents information of no value. The matrix of
  filter coefficients is a circulant matrix, so that the right-hand side of
  the equation is effectively a convolution of the discrete filter

  <\equation*>
    <wide|h|~>=<frac|1|<sqrt|2>><around*|[|a<rsub|0>,0,0,0,\<ldots\>,0,a<rsub|N-1>,\<ldots\>,a<rsub|2>,a<rsub|1>|]><rsup|\<Tau\>>
  </equation*>

  with the data <math|c<rsub|m,k>>. Only every other sample of the result
  needs be kept; this process is called decimation. Similarly, the
  <math|d<rsub|m-1,k>> is effectively a convolution of the discrete filter

  <\equation*>
    <wide|g|~>=<frac|1|<sqrt|2>><around*|[|a<rsub|N-1>,0,0,0,\<ldots\>,0,-a<rsub|0>,\<ldots\>,a<rsub|N-3>,-a<rsub|N-2>|]><rsup|\<Tau\>>
  </equation*>

  with the data <math|c<rsub|m,k>>. The above two steps constitutes the
  Mallat transform (decomposition). The reconstruction algorithm can allso be
  obtained by the matrix form of equation (<reference|InverseMallatTrans>):

  <\enumerate>
    <item>insert a zero between every sample in <math|c<rsub|m-1,k>> and
    <math|d<rsub|m-1,k>>,

    <item>convolve <math|c<rsub|m-1,k>> with the filter <math|h>,

    <item>convolve <math|d<rsub|m-1,k>> with the filter <math|g>,

    <item>add results in 2. and 3. to get the original data,
    <math|c<rsub|m,k>>,
  </enumerate>

  where the filters <math|h> and <math|g> are

  <\equation*>
    h=<frac|1|<sqrt|2>><around*|[|a<rsub|0>,a<rsub|1>,a<rsub|2>,a<rsub|3>,\<ldots\>,a<rsub|N-2>,a<rsub|N-1>,\<ldots\>,0,0|]><rsup|\<Tau\>>
  </equation*>

  and

  <\equation*>
    g=<frac|1|<sqrt|2>><around*|[|a<rsub|N-1>,-a<rsub|N-2>,a<rsub|N-3>,-a<rsub|N-4>,\<ldots\>,a<rsub|1>,-a<rsub|0>,\<ldots\>,0,0|]><rsup|\<Tau\>>
  </equation*>

  <subsection|Notes on Wavelet Transform Algorithm>

  In practice <cite|williams1994introduction>, the scaling function
  decomposition does not usually need to be carried out since, at the finest
  scale, the scaling function approaches the delta function, i.e.

  <\equation*>
    \<phi\><rsub|m,k><around*|(|x|)>\<rightarrow\>2<rsup|m/2>\<delta\><around*|(|2<rsup|m>x-k|)><space|1em>as
    m\<rightarrow\>\<infty\>,
  </equation*>

  and this is the basis for a discrete sampling of <math|f<around*|(|x|)>>.
  The projection of <math|f> onto the space of delta function is

  <\equation>
    P<rsub|m>f<around*|(|x|)>=<big|sum><rsub|k=-\<infty\>><rsup|+\<infty\>>f<rsub|k>
    2<rsup|m>\<delta\><around*|(|2<rsup|m>x-k|)><rsub|><label|expansiondelta-pm>
  </equation>

  where

  <\equation*>
    f<rsub|k>=f<around*|(|2<rsup|-m>k|)>.
  </equation*>

  A comparision between equation (<reference|expansion-pm>) and
  (<reference|expansiondelta-pm>) leads to

  <\equation*>
    c<rsub|m,k>\<approx\>2<rsup|m>f<rsub|k>=2<rsup|m>
    f<around*|(|2<rsup|-m>k|)><space|1em>as m is very large.
  </equation*>

  But if <math|m> is not large enough, the sampling process described above
  may introduce extra error in which case the integral according to
  definition of <math|c<rsub|m,k>> is required.

  <chapter|Wavelet in Numerical Analysis>

  <section|Some Useful Orthogonal Wavelets>

  <subsection|Meyer Wavelet>

  The Mayer Wavelet is defined by the following formula according to
  <cite|frohlich1993adaptive>, <cite|daubechies1992ten>, and
  <cite|vermehren2015close><\footnote>
    The formula given in appendix of <cite|frohlich1993adaptive> is not
    correct.
  </footnote>,

  <\equation*>
    <wide|\<phi\>|^><around*|(|\<xi\>|)>=<around*|{|<tabular|<tformat|<table|<row|<cell|1>|<cell|;<around*|\||\<xi\>|\|>\<leqslant\><frac|1|3>>>|<row|<cell|cos<around*|(|<frac|\<mathpi\>|2>\<nu\><around*|(|3<around*|\||\<xi\>|\|>-1|)>|)>>|<cell|;<frac|1|3>\<leqslant\><around*|\||\<xi\>|\|>\<leqslant\><frac|2|3>>>|<row|<cell|0>|<cell|;elsewhere>>>>>|\<nobracket\>>
  </equation*>

  and

  <\equation*>
    <wide|\<psi\>|^><around*|(|\<xi\>|)>=<around*|{|<tabular|<tformat|<table|<row|<cell|\<mathe\><rsup|\<mathi\>\<mathpi\>\<xi\>>cos<around*|(|<frac|\<mathpi\>|2>\<nu\><around*|(|-3<around*|\||\<xi\>|\|>+2|)>|)>>|<cell|;<frac|1|3>\<leqslant\><around*|\||\<xi\>|\|>\<leqslant\><frac|2|3>>>|<row|<cell|\<mathe\><rsup|\<mathi\>\<mathpi\>\<xi\>>cos<around*|(|<frac|\<mathpi\>|2>\<nu\><around*|(|<frac|3|2><around*|\||\<xi\>|\|>-1|)>|)>>|<cell|;<frac|2|3>\<leqslant\><around*|\||\<xi\>|\|>\<leqslant\><frac|4|3>>>|<row|<cell|0>|<cell|;elsewhere>>>>>|\<nobracket\>>.
  </equation*>

  <\big-figure>
    <image|Figures/Spectrum_Meyer_scalefunction.png|424px|240px||>
  </big-figure|<label|fig:MeyerScalingSpectrum>The Meyer scaling function in
  frequency space, it should be pointed out that the definition of Fourier
  transform in the figure is different from Equation
  (<reference|FourierTrans>) in Prologue, and the relation is
  <math|\<Phi\><rsub|meyer><around*|(|\<xi\>|)>=<wide|\<phi\>|^><around*|(|2\<pi\>\<xi\>|)>/<sqrt|2\<mathpi\>>>.>

  <big-figure|<image|Figures/Spectrum_Meyer_wavelet.png|526px|206px||>|<label|fig:MeyerWaveletSpectrum>The
  Meyer wavelet function in frequency space, it should be pointed out that
  the definition of Fourier transform in the figure is different from
  Equation (<reference|FourierTrans>) in Prologue, and the relation is
  <math|\<Psi\><rsub|meyer><around*|(|\<xi\>|)>=<wide|\<psi\>|^><around*|(|2\<pi\>\<xi\>|)>/<sqrt|2\<mathpi\>>>.>

  For the smooth \Pstep function\Q <math|\<nu\>>, two properties are
  required:

  <\equation*>
    \<nu\><around*|(|x|)>=<around*|{|<tabular|<tformat|<table|<row|<cell|0>|<cell|;x\<leqslant\>0>>|<row|<cell|1>|<cell|;x\<geqslant\>1>>>>>|\<nobracket\>><space|1em>and<space|1em>\<nu\><around*|(|x|)>+\<nu\><around*|(|1-x|)>=1,
  </equation*>

  and the choice given by <cite|daubechies1992ten> with best localisation in
  physical domain is

  <\equation*>
    \<nu\><around*|(|x|)>=x<rsup|4><around*|(|35-84x+70x<rsup|2>-20x<rsup|3>|)><space|1em>0\<leqslant\>x\<leqslant\>1,
  </equation*>

  leading to the 3rd order of Mayer wavelet as the exponential index in term
  <math|-20x<rsup|3>> is <math|3>. If the zeroth order of Mayer wavelet is
  chosen:

  <\equation*>
    \<nu\><around*|(|x|)>=<around*|{|<tabular|<tformat|<table|<row|<cell|0>|<cell|;x\<less\>0>>|<row|<cell|x>|<cell|;0\<less\>x\<less\>1>>|<row|<cell|1>|<cell|;x\<gtr\>1>>>>>|\<nobracket\>>,
  </equation*>

  analytical expressions of scaling function and wavelet on time domain can
  be attained <cite|vermehren2015close>:

  <\equation*>
    \<phi\><around*|(|t|)>=<around*|{|<tabular|<tformat|<table|<row|<cell|<frac|2|3>+<frac|4|3\<mathpi\>>>|<cell|;t=0>>|<row|<cell|<frac|sin<frac|2\<mathpi\>t|3>+<frac|4|3>t
    cos<frac|4\<mathpi\>t|3>|\<mathpi\>t-<frac|16|9>\<mathpi\>
    t<rsup|3>>>|<cell|;elsewhere>>>>>|\<nobracket\>>
  </equation*>

  and

  <\equation*>
    \<psi\><around*|(|t|)>=\<psi\><rsub|1><around*|(|t|)>+\<psi\><rsub|2><around*|(|t|)>
  </equation*>

  where

  <\equation*>
    \<psi\><rsub|1><around*|(|t|)>=<frac|<frac|4|3\<mathpi\>><around*|(|t-0.5|)>cos<around*|(|<frac|2\<mathpi\>|3><around*|(|t-0.5|)>|)>-<frac|1|\<mathpi\>>sin<around*|(|<frac|4\<mathpi\>|3><around*|(|t-0.5|)>|)>|<around*|(|t-0.5|)>-<frac|16|9><around*|(|t-0.5|)><rsup|3>>
  </equation*>

  and

  <\equation*>
    \<psi\><rsub|2><around*|(|t|)>=<frac|<frac|8|3\<mathpi\>><around*|(|t-0.5|)>cos<around*|(|<frac|8\<mathpi\>|3><around*|(|t-0.5|)>|)>+<frac|1|\<mathpi\>>sin<around*|(|<frac|4\<mathpi\>|3><around*|(|t-0.5|)>|)>|<around*|(|t-0.5|)>-<frac|64|9><around*|(|t-0.5|)><rsup|3>>
  </equation*>

  \;

  Mayer wavelet, as one of the most important orthogonal wavelets is
  constructed earlier than the invention of MRA. It is defined in
  <with|font-shape|italic|frequency space> and the purpose of this
  construction is to realize localization in frequency space (shown in Figure
  <reference|fig:MeyerScalingSpectrum> and
  <reference|fig:MeyerWaveletSpectrum>). The 3rd order Meyer wavelet system
  in time domain is sketched in Figure <reference|fig:MeyerPhi> and
  <reference|fig:MeyerPsi>.

  <big-figure|<image|Figures/MeyerWavetletPhi.pdf||||>|<label|fig:MeyerPhi>Scaling
  function of Meyer wavelet>

  <big-figure|<image|Figures/MeyerWavetletPsi.pdf||||>|<label|fig:MeyerPsi>Meyer
  wavelet function>

  \;

  <subsection|Shannon Wavelet>

  The Shanonn wavelet is very similar to Meyer wavelet while it is also
  defined on frequency space with normalised gate function. As a result, it
  has very simple analytical expression (though poor convergence property):

  <\equation*>
    \<phi\><around*|(|t|)>=sinc<around*|(|t|)>=<frac|sin
    \<mathpi\>t|\<mathpi\>t>
  </equation*>

  and

  <\equation*>
    \<psi\><around*|(|t|)>=sinc<around*|(|<frac|t|2>|)>\<cdot\>cos<around*|(|<frac|3\<mathpi\>t|2>|)>=2\<cdot\>sinc<around*|(|2t-1|)>-sinc<around*|(|t|)>.
  </equation*>

  There is also complex continuous Shanno wavelet:

  <\equation*>
    \<psi\><rsup|<around*|(|C Sha|)>><around*|(|t|)>=sinc<around*|(|t|)>\<cdot\>\<mathe\><rsup|-2\<mathpi\>\<mathi\>t>
  </equation*>

  <big-figure|<image|Figures/ShannonWaveletPhi.pdf||||>|<label|fig:ShanonnPhi>sinc
  function>

  <big-figure|<image|Figures/ShannonWaveletPsi.pdf||||>|<label|fig:ShanonnPsi>Shanonn
  wavelet (real)>

  <subsection|Daubechies Wavelet>

  The construction of Daubechies wavelet has been discussed in great detail
  in Chapter <reference|chap:ConstructionWaveletSystem>. The difference
  between different orders of Daubechies wavelet are quite large, so they are
  sketched out in detail. D1 means the first order<\footnote>
    The order of Daubechies wavelet is defined as the order of its vanishming
    moment.
  </footnote> of Daubechies wavelet, i.e. Haar wavelet, D2 means the second
  order of Daubechies wavelet, and so on.

  <\big-figure>
    <image|Figures/D2WaveletPhi.pdf||||>

    <image|Figures/D2WaveletPsi.pdf||||>
  </big-figure|The scaling function (upper) and wavelet function (lower) of
  D2>

  \;

  <\big-figure>
    <image|Figures/D4WaveletPhi.pdf||||>

    <image|Figures/D4WaveletPsi.pdf||||>
  </big-figure|The scaling function (upper) and wavelet function (lower) of
  D4>

  \;

  <\big-figure>
    <image|Figures/D9WaveletPhi.pdf||||>

    <image|Figures/D9WaveletPsi.pdf||||>
  </big-figure|The scaling function (upper) and wavelet function (lower) of
  D9>

  <subsection|Symlet Wavelet>

  <subsection|Coiflet Wavelet>

  <subsection|Battle-Lemarié Wavelet>

  Battle-Lemarié wavelet are wavelet in the form of

  <\equation*>
    \<psi\><around*|(|x|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>>c<rsub|k>
    N<rsub|m><around*|(|2x-k|)>,
  </equation*>

  while <math|N<rsub|m >> is the <math|m>th order of B-spline.

  <\big-figure>
    <image|Figures/BL1WaveletPhi.pdf||||>

    <image|Figures/BL1WaveletPsi.pdf||||>
  </big-figure|The scaling function (upper) and wavelet function (lower) of
  1st order Battle-Lemarié wavelet.>

  \;

  <\big-figure>
    <image|Figures/BL2WaveletPhi.pdf||||>

    <image|Figures/BL2WaveletPsi.pdf||||>
  </big-figure|The scaling function (upper) and wavelet function (lower) of
  2nd order Battle-Lemarié wavelet.>

  \;

  <\big-figure>
    <image|Figures/BL3WaveletPhi.pdf||||>

    <image|Figures/BL3WaveletPsi.pdf||||>
  </big-figure|The scaling function (upper) and wavelet function (lower) of
  3rd order Battle-Lemarié wavelet.>

  <subsection|Biorthogonal spline Wavelet>

  <subsection|Reverse B-spline Wavelet>

  \;

  \;

  <\equation*>
    \;
  </equation*>

  <section|Miscellaneous Staff>

  <subsection|Learning Resources>

  <\itemize>
    <item>All references are good reading materials, especially
    <cite|daubechies1992ten>.

    <item>Mathematica's <with|font-shape|italic|Wolfram Documentation> is the
    best material as a starting point of learning how to apply wavelet.
  </itemize>

  <part|Application of Wavelet Analysis in CFD>

  <chapter|Miscellaneous Staff>

  <section|Orthogonal Wavelet with Gaussian Distribution as Scaling
  Function?>

  The answer is that this is not feasible. Suppose we have

  <\equation*>
    \<phi\><around*|(|x|)>=<frac|1|<sqrt|2\<mathpi\>>>\<mathe\><rsup|-<frac|<around*|(|x-x<rsub|0>|)><rsup|2>|2>>,
  </equation*>

  then it can be calculated that

  <\equation*>
    <wide|\<phi\>|^><around*|(|\<gamma\>|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>\<phi\><around*|(|x|)>\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>x>\<mathd\>x=\<mathe\><rsup|-2\<mathpi\>\<gamma\><around*|(|\<mathi\>x<rsub|0>+2\<mathpi\>\<gamma\>|)>>.
  </equation*>

  However we have also

  <\equation*>
    H<rsub|0><around*|(|\<gamma\>|)>=<frac|<wide|\<phi\>|^><around*|(|2\<gamma\>|)>|<wide|\<phi\>|^><around*|(|\<gamma\>|)>>=\<mathe\><rsup|-6\<mathpi\><rsup|2>\<gamma\><rsup|2>>\<mathe\><rsup|-2\<mathpi\>\<mathi\>\<gamma\>x<rsub|0>>
  </equation*>

  which is unfortunately not 1-periodic: this violates theorem
  <reference|thm:constructionMRA>. So it is imposible to construct an
  orthogonal wavelet with Gaussian distriubtion as its scaling function.

  However, it is still posible to construct a biorthogonal wavelet from
  wavelet frame generated by Gaussian distribution.

  <section|Approximation of Gaussian Distribution with Orthogonal Wavelets>

  In this section, a series of numerical test is carried out to compress the
  data representing a Gaussian distribution. The Gaussian distribution is
  modeled here as:

  <\equation*>
    f<around*|(|x|)>=exp<around*|(|-<frac|x<rsup|2>|2>|)> .
  </equation*>

  Wavelet transform with four levels of refinement is applied on sampled data
  points, and a threshold of <math|\<epsilon\>=5\<times\>10<rsup|-5>> is
  applied to both the original data and the transformed data. The error
  caused by the compression is measured with a numerical integral by
  rectangle formula

  <\equation*>
    Err=<frac|1|10><big|int><rsub|-5><rsup|5><around*|\||f<around*|(|x|)>-<wide|f|~><around*|(|x|)>|\|>\<mathd\>x=<frac|1|10><big|sum><rsub|n><around*|\||f<around*|(|x<rsub|n>|)>-<wide|f|~><around*|(|x<rsub|n>|)>|\|>\<Delta\>x.
  </equation*>

  \ The comparision is shown in table <reference|tab:compression01> and
  <reference|tab:compression02>.

  Two typical cases are examined. The sampling interval are both
  <math|<around*|[|-5,5|]>> since <math|\<mathe\><rsup|-12.5>=3.7\<times\>10<rsup|-6>>
  is small enough. In the first case, the sampling rate is one sample point
  per 0.1 unit of length; in the second case, the sampling rate is one sample
  point per 0.01 unit of length. Meyer wavelet and Shannon wavelet do not
  work well on compressing the data<\footnote>
    The compression ratio is less than <math|2> even in the second case.
  </footnote>, and the B-spline wavelet is the only one that performs good
  compressing ratio among all spline-based wavelets. The result of Haar
  wavelet is also provides for comparison.

  <big-table|<tabular|<tformat|<cwith|1|-1|1|-1|cell-hyphen|t>|<twith|table-lborder|0.1>|<twith|table-rborder|0.1>|<twith|table-bborder|0.1>|<twith|table-tborder|0.1>|<table|<row|<\cell>
    \;
  </cell>|<\cell>
    <math|N<rsub|ori>>
  </cell>|<\cell>
    <math|N<rsub|trans>>
  </cell>|<\cell>
    <math|\<alpha\>>
  </cell>|<\cell>
    <math|Err>
  </cell>>|<row|<\cell>
    Haar
  </cell>|<\cell>
    89
  </cell>|<\cell>
    88
  </cell>|<\cell>
    1.011
  </cell>|<\cell>
    <math|6.12\<times\>10<rsup|-7>>
  </cell>>|<row|<\cell>
    Daubechies 9
  </cell>|<\cell>
    89
  </cell>|<\cell>
    36
  </cell>|<\cell>
    2.472
  </cell>|<\cell>
    <math|1.24\<times\>10<rsup|-5>>
  </cell>>|<row|<\cell>
    Coiflet 5
  </cell>|<\cell>
    89
  </cell>|<\cell>
    41
  </cell>|<\cell>
    2.171
  </cell>|<\cell>
    <math|1.73\<times\>10<rsup|-5>>
  </cell>>|<row|<\cell>
    Symlet 10
  </cell>|<\cell>
    89
  </cell>|<\cell>
    39
  </cell>|<\cell>
    2.282
  </cell>|<\cell>
    <math|1.04\<times\>10<rsup|-5>>
  </cell>>|<row|<\cell>
    B-spline 6 2
  </cell>|<\cell>
    89
  </cell>|<\cell>
    25
  </cell>|<\cell>
    3.560
  </cell>|<\cell>
    <math|5.75\<times\>10<rsup|-7>>
  </cell>>>>>|<label|tab:compression01>Case 1 where there is one sample point
  per 0.1 unit of length has totally 101 sampling points. <math|\<alpha\>> is
  compression ration, <math|N<rsub|ori>> is the number of sampling points in
  original data that is lager than the threshold, and <math|N<rsub|trans>> is
  the number of data points in tranformed data that is lager than the
  threshold.>

  <big-table|<tabular|<tformat|<table|<row|<cell|<tabular*|<tformat|<table|<row|<cell|<tabular|<tformat|<cwith|1|-1|1|-1|cell-hyphen|t>|<twith|table-lborder|0.1>|<twith|table-rborder|0.1>|<twith|table-bborder|0.1>|<twith|table-tborder|0.1>|<table|<row|<\cell>
    \;
  </cell>|<\cell>
    <math|N<rsub|ori>>
  </cell>|<\cell>
    <math|N<rsub|trans>>
  </cell>|<\cell>
    <math|\<alpha\>>
  </cell>|<\cell>
    <math|Err>
  </cell>>|<row|<\cell>
    Haar
  </cell>|<\cell>
    891
  </cell>|<\cell>
    760
  </cell>|<\cell>
    1.172
  </cell>|<\cell>
    <math|4.60\<times\>10<rsup|-7>>
  </cell>>|<row|<\cell>
    Daubechies 8
  </cell>|<\cell>
    891
  </cell>|<\cell>
    59
  </cell>|<\cell>
    15.10
  </cell>|<\cell>
    <math|4.58\<times\>10<rsup|-7>>
  </cell>>|<row|<\cell>
    Coiflet 5
  </cell>|<\cell>
    891
  </cell>|<\cell>
    59
  </cell>|<\cell>
    15.10
  </cell>|<\cell>
    <math|4.43\<times\>10<rsup|-7>>
  </cell>>|<row|<\cell>
    Symlet 5
  </cell>|<\cell>
    891
  </cell>|<\cell>
    59
  </cell>|<\cell>
    15.10
  </cell>|<\cell>
    <math|4.45\<times\>10<rsup|-7>>
  </cell>>|<row|<\cell>
    B-spline 4 2
  </cell>|<\cell>
    891
  </cell>|<\cell>
    59
  </cell>|<\cell>
    15.10
  </cell>|<\cell>
    <math|3.68\<times\>10<rsup|-7>>
  </cell>>>>>>>>>>>>>>>|<label|tab:compression02><label|tab:compression02>Case
  1 where there is one sample point per 0.01 unit of length has totally 1001
  sampling points. One thing to mention is that Daubechies 5 has already
  reduce the amout of meaningfu data to 60 samples. <math|\<alpha\>> is
  compression ration, <math|N<rsub|ori>> is the number of sampling points in
  original data that is lager than the threshold, and <math|N<rsub|trans>> is
  the number of data points in tranformed data that is lager than the
  threshold.>

  <\bibliography|bib|tm-plain|ReadingNotes.bib>
    <\bib-list|8>
      <bibitem*|1><label|bib-WangJizeng2001>\<#738B\>\<#8BB0\>\<#589E\>.<newblock>
      <with|font-shape|italic|<with|font|uming|\<#6B63\>\<#4EA4\>\<#5C0F\>\<#6CE2\>\<#7EDF\>\<#4E00\>\<#7406\>\<#8BBA\>\<#4E0E\>\<#65B9\>\<#6CD5\>\<#53CA\>\<#5176\>\<#5728\>\<#538B\>\<#7535\>\<#667A\>\<#80FD\>\<#7ED3\>\<#6784\>\<#7B49\>\<#529B\>\<#5B66\>\<#7814\>\<#7A76\>\<#4E2D\>\<#7684\>\<#5E94\>\<#7528\>
      >[D]>.<newblock> <localize|PhD thesis>, 2001.<newblock>

      <bibitem*|2><label|bib-christensen2010functions>Ole
      Christensen.<newblock> <with|font-shape|italic|Functions, spaces, and
      expansions: mathematical tools in physics and engineering>.<newblock>
      Springer Science & Business Media, 2010.<newblock>

      <bibitem*|3><label|bib-daubechies1992ten>Ingrid Daubechies.<newblock>
      <with|font-shape|italic|Ten lectures on wavelets>.<newblock> SIAM,
      1992.<newblock>

      <bibitem*|4><label|bib-frohlich1993adaptive>Jochen Fröhlich.<newblock>
      An adaptive wavelet galerkin algorithm for one and two dimensional
      flame computations.<newblock> 1993.<newblock>

      <bibitem*|5><label|bib-schneider2010wavelet>Kai Schneider<localize| and
      >Oleg<nbsp>V Vasilyev.<newblock> Wavelet methods in computational fluid
      dynamics.<newblock> <with|font-shape|italic|Annual Review of Fluid
      Mechanics>, 42:473\U503, 2010.<newblock>

      <bibitem*|6><label|bib-vermehren2015close>V Vermehren<localize| and >HM
      de<nbsp>Oliveira.<newblock> Close expressions for meyer wavelet and
      scale function.<newblock> <with|font-shape|italic|ArXiv preprint
      arXiv:1502.00161>, 2015.<newblock>

      <bibitem*|7><label|bib-williams1994introduction>John<nbsp>R
      Williams<localize| and >Kevin Amaratunga.<newblock> Introduction to
      wavelets in engineering.<newblock> <with|font-shape|italic|International
      journal for numerical methods in engineering>, 37(14):2365\U2388,
      1994.<newblock>

      <bibitem*|8><label|bib-walnut2013introduction>David<nbsp>F
      Walnut.<newblock> <with|font-shape|italic|An introduction to wavelet
      analysis>.<newblock> Springer Science & Business Media, 2013.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|info-flag|detailed>
    <associate|page-medium|papyrus>
    <associate|preamble|false>
  </collection>
</initial>

<\attachments>
  <\collection>
    <\associate|bib-bibliography>
      <\db-entry|+SQhuTNDPWOs9qY|book|christensen2010functions>
        <db-field|contributor|jacob>

        <db-field|modus|imported>

        <db-field|date|1489504126>
      <|db-entry>
        <db-field|author|Ole <name|Christensen>>

        <db-field|title|Functions, spaces, and expansions: mathematical tools
        in physics and engineering>

        <db-field|publisher|Springer Science & Business Media>

        <db-field|year|2010>
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

      <\db-entry|+SQhuTNDPWOs9qZ|book|walnut2013introduction>
        <db-field|contributor|jacob>

        <db-field|modus|imported>

        <db-field|date|1489507129>
      <|db-entry>
        <db-field|author|David F <name|Walnut>>

        <db-field|title|An introduction to wavelet analysis>

        <db-field|publisher|Springer Science & Business Media>

        <db-field|year|2013>
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

      <\db-entry|+cJ9jyZg8Q6HzUJ|phdthesis|WangJizeng2001>
        <db-field|contributor|jacob>

        <db-field|modus|imported>

        <db-field|date|1489210219>

        <db-field|newer|+SQhuTNDPWOs9qX>
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

      <\db-entry|+3t2IHAvNbx39fP|article|frohlich1993adaptive>
        <db-field|contributor|jacob>

        <db-field|modus|imported>

        <db-field|date|1491202735>
      <|db-entry>
        <db-field|author|Jochen <name|Fröhlich>>

        <db-field|title|An adaptive wavelet galerkin algorithm for one and
        two dimensional flame computations>

        <db-field|year|1993>

        <db-field|publisher|Deutsche Nationalbibliothek>
      </db-entry>

      <\db-entry|+3t2IHAvNbx39fq|article|vermehren2015close>
        <db-field|contributor|jacob>

        <db-field|modus|imported>

        <db-field|date|1491221642>
      <|db-entry>
        <db-field|author|V <name|Vermehren><name-sep>HM <name-von|de>
        <name|Oliveira>>

        <db-field|title|Close expressions for meyer wavelet and scale
        function>

        <db-field|journal|arXiv preprint arXiv:1502.00161>

        <db-field|year|2015>
      </db-entry>
    </associate>
  </collection>
</attachments>

<\references>
  <\collection>
    <associate|ConstructionWaveletSystem|<tuple|2|?>>
    <associate|FourierTrans|<tuple|1|3>>
    <associate|InverseMallatTrans|<tuple|2.6|20>>
    <associate|MallatInversTrans|<tuple|2.5|?>>
    <associate|MallatTrans|<tuple|2.4|?>>
    <associate|MallatTransC|<tuple|2.4|20>>
    <associate|MallatTransD|<tuple|2.5|20>>
    <associate|Vj|<tuple|1.1|8>>
    <associate|auto-1|<tuple|?|3>>
    <associate|auto-10|<tuple|1.1|13>>
    <associate|auto-11|<tuple|1.2|14>>
    <associate|auto-12|<tuple|1.2.2|14>>
    <associate|auto-13|<tuple|1.2.3|15>>
    <associate|auto-14|<tuple|2|17>>
    <associate|auto-15|<tuple|2.1|17>>
    <associate|auto-16|<tuple|2.1.1|17>>
    <associate|auto-17|<tuple|2.1.2|17>>
    <associate|auto-18|<tuple|2.1.3|18>>
    <associate|auto-19|<tuple|2.1.4|19>>
    <associate|auto-2|<tuple|I|5>>
    <associate|auto-20|<tuple|2.2|19>>
    <associate|auto-21|<tuple|2.3|19>>
    <associate|auto-22|<tuple|2.3.1|20>>
    <associate|auto-23|<tuple|2.3.2|20>>
    <associate|auto-24|<tuple|2.3.3|20>>
    <associate|auto-25|<tuple|2.3.4|21>>
    <associate|auto-26|<tuple|3|23>>
    <associate|auto-27|<tuple|3.1|23>>
    <associate|auto-28|<tuple|3.1.1|23>>
    <associate|auto-29|<tuple|3.1|23>>
    <associate|auto-3|<tuple|1|7>>
    <associate|auto-30|<tuple|3.2|24>>
    <associate|auto-31|<tuple|3.3|25>>
    <associate|auto-32|<tuple|3.4|25>>
    <associate|auto-33|<tuple|3.1.2|25>>
    <associate|auto-34|<tuple|3.5|26>>
    <associate|auto-35|<tuple|3.6|26>>
    <associate|auto-36|<tuple|3.1.3|26>>
    <associate|auto-37|<tuple|3.7|27>>
    <associate|auto-38|<tuple|3.8|28>>
    <associate|auto-39|<tuple|3.9|29>>
    <associate|auto-4|<tuple|1.1|7>>
    <associate|auto-40|<tuple|3.1.4|29>>
    <associate|auto-41|<tuple|3.1.5|29>>
    <associate|auto-42|<tuple|3.1.6|29>>
    <associate|auto-43|<tuple|3.10|29>>
    <associate|auto-44|<tuple|3.11|29>>
    <associate|auto-45|<tuple|3.12|30>>
    <associate|auto-46|<tuple|3.1.7|30>>
    <associate|auto-47|<tuple|3.1.8|31>>
    <associate|auto-48|<tuple|3.2|33>>
    <associate|auto-49|<tuple|3.2.1|33>>
    <associate|auto-5|<tuple|1.1.1|7>>
    <associate|auto-50|<tuple|II|33>>
    <associate|auto-51|<tuple|4|34>>
    <associate|auto-52|<tuple|4.1|34>>
    <associate|auto-53|<tuple|4.2|35>>
    <associate|auto-54|<tuple|4.1|?>>
    <associate|auto-55|<tuple|4.2|?>>
    <associate|auto-56|<tuple|4.2|?>>
    <associate|auto-6|<tuple|1.1.2|7>>
    <associate|auto-7|<tuple|1.1.3|10>>
    <associate|auto-8|<tuple|1.2|12>>
    <associate|auto-9|<tuple|1.2.1|12>>
    <associate|basicEstimate|<tuple|1.8|11>>
    <associate|bib-WangJizeng2001|<tuple|1|35>>
    <associate|bib-christensen2010functions|<tuple|2|35>>
    <associate|bib-daubechies1992ten|<tuple|3|35>>
    <associate|bib-frohlich1993adaptive|<tuple|4|35>>
    <associate|bib-schneider2010wavelet|<tuple|5|35>>
    <associate|bib-vermehren2015close|<tuple|6|35>>
    <associate|bib-walnut2013introduction|<tuple|8|35>>
    <associate|bib-williams1994introduction|<tuple|7|35>>
    <associate|chap:ConstructionWaveletSystem|<tuple|2|17>>
    <associate|daubechiesL|<tuple|1.10|12>>
    <associate|def:multiresolutionAnalysis|<tuple|1.4|8>>
    <associate|dilation|<tuple|1.16|15>>
    <associate|eg:haarMRA|<tuple|1.6|8>>
    <associate|expansion-pm|<tuple|1.21|15>>
    <associate|expansiondelta-pm|<tuple|2.7|21>>
    <associate|fig:MeyerPhi|<tuple|3.3|25>>
    <associate|fig:MeyerPsi|<tuple|3.4|25>>
    <associate|fig:MeyerScalingSpectrum|<tuple|3.1|23>>
    <associate|fig:MeyerWaveletSpectrum|<tuple|3.2|24>>
    <associate|fig:ShanonnPhi|<tuple|3.5|26>>
    <associate|fig:ShanonnPsi|<tuple|3.6|26>>
    <associate|fig:blowup|<tuple|1.1|13>>
    <associate|fig:haarWavelet2|<tuple|1.2|14>>
    <associate|footnote-1|<tuple|1|?>>
    <associate|footnote-1.1|<tuple|1.1|14>>
    <associate|footnote-1.2|<tuple|1.2|15>>
    <associate|footnote-2|<tuple|2|?>>
    <associate|footnote-2.1|<tuple|2.1|17>>
    <associate|footnote-3.1|<tuple|3.1|23>>
    <associate|footnote-3.2|<tuple|3.2|27>>
    <associate|footnote-4.1|<tuple|4.1|33>>
    <associate|footnr-1|<tuple|1|?>>
    <associate|footnr-1.1|<tuple|1.1|14>>
    <associate|footnr-1.2|<tuple|1.2|15>>
    <associate|footnr-2|<tuple|2|?>>
    <associate|footnr-2.1|<tuple|2.1|17>>
    <associate|footnr-3.1|<tuple|3.1|23>>
    <associate|footnr-3.2|<tuple|3.2|26>>
    <associate|footnr-4.1|<tuple|4.1|33>>
    <associate|h1|<tuple|1.3|9>>
    <associate|haarWavelet|<tuple|1.2.1|12>>
    <associate|lem:spaceVj|<tuple|1.5|8>>
    <associate|normal-cond|<tuple|2.1|18>>
    <associate|orthogonal-cond|<tuple|2.2|18>>
    <associate|pq-relationship|<tuple|1.22|15>>
    <associate|psiScaling|<tuple|1.4|9>>
    <associate|psiScalingExplicit|<tuple|1.5|9>>
    <associate|representation|<tuple|1.6|10>>
    <associate|scalingEquation|<tuple|1.2|9>>
    <associate|sec:EgHaarWavelet|<tuple|1.2.1|?>>
    <associate|sec:haarWavelet|<tuple|1.2.1|?>>
    <associate|tab:compression01|<tuple|4.1|34>>
    <associate|tab:compression02|<tuple|4.2|34>>
    <associate|thm:constructionMRA|<tuple|1.14|10>>
    <associate|thm:constructionWavelet|<tuple|1.10|9>>
    <associate|thm:constructionWavlet|<tuple|1.10|?>>
    <associate|thm:decay|<tuple|1.18|11>>
    <associate|thm:vanishingMoment|<tuple|1.19|11>>
    <associate|thresholdingCondition|<tuple|1.7|10>>
    <associate|vanishing-cond|<tuple|2.3|18>>
    <associate|vanishingMomentH|<tuple|1.9|11>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      christensen2010functions

      schneider2010wavelet

      walnut2013introduction

      walnut2013introduction

      daubechies1992ten

      WangJizeng2001

      williams1994introduction

      daubechies1992ten

      williams1994introduction

      daubechies1992ten

      williams1994introduction

      daubechies1992ten

      williams1994introduction

      williams1994introduction

      schneider2010wavelet

      schneider2010wavelet

      williams1994introduction

      frohlich1993adaptive

      daubechies1992ten

      vermehren2015close

      frohlich1993adaptive

      daubechies1992ten

      vermehren2015close

      daubechies1992ten
    </associate>
    <\associate|figure>
      <tuple|normal|(upper) A function <with|mode|<quote|math>|f> with
      support <with|mode|<quote|math>|<around*|[|-2<rsup|J<rsub|1>>,2<rsup|J<rsub|1>>|]>>,
      piecewise constant on the <with|mode|<quote|math>|<around*|[|\<ell\>2<rsup|-J<rsub|0>>,<around*|(|\<ell\>+1|)>2<rsup|-J<rsub|0>>|)>.>
      (lower) A blowup of a portion of <with|mode|<quote|math>|f>.|<pageref|auto-10>>

      <tuple|normal|Extending interval <with|mode|<quote|math>|<around*|[|-2<rsup|J<rsub|1>>,2<rsup|J<rsub|1>>|]>>
      to <with|mode|<quote|math>|<around*|[|-2<rsup|J<rsub|1>+1>,2<rsup|J<rsub|1>+1>|]>>.|<pageref|auto-11>>

      <tuple|normal|The Meyer scaling function in frequency space, it should
      be pointed out that the definition of Fourier transform in the figure
      is different from Equation (<reference|FourierTrans>) in Prologue, and
      the relation is <with|mode|<quote|math>|\<Phi\><rsub|meyer><around*|(|\<xi\>|)>=<wide|\<phi\>|^><around*|(|2\<pi\>\<xi\>|)>/<sqrt|2\<mathpi\>>>.|<pageref|auto-29>>

      <tuple|normal|The Meyer wavelet function in frequency space, it should
      be pointed out that the definition of Fourier transform in the figure
      is different from Equation (<reference|FourierTrans>) in Prologue, and
      the relation is <with|mode|<quote|math>|\<Psi\><rsub|meyer><around*|(|\<xi\>|)>=<wide|\<psi\>|^><around*|(|2\<pi\>\<xi\>|)>/<sqrt|2\<mathpi\>>>.|<pageref|auto-30>>

      <tuple|normal|Scaling function of Meyer wavelet|<pageref|auto-31>>

      <tuple|normal|Meyer wavelet function|<pageref|auto-32>>

      <tuple|normal|sinc function|<pageref|auto-34>>

      <tuple|normal|Shanonn wavelet (real)|<pageref|auto-35>>

      <tuple|normal|The scaling function (upper) and wavelet function (lower)
      of D2|<pageref|auto-37>>

      <tuple|normal|The scaling function (upper) and wavelet function (lower)
      of D4|<pageref|auto-38>>

      <tuple|normal||<pageref|auto-39>>
    </associate>
    <\associate|table>
      <tuple|normal|Case 1 where there is one sample point per 0.1 unit of
      length has totally 101 sampling points.
      <with|mode|<quote|math>|\<alpha\>> is compression ration,
      <with|mode|<quote|math>|N<rsub|ori>> is the number of sampling points
      in original data that is lager than the threshold, and
      <with|mode|<quote|math>|N<rsub|trans>> is the number of data points in
      tranformed data that is lager than the threshold.|<pageref|auto-51>>

      <tuple|normal|Case 1 where there is one sample point per 0.01 unit of
      length has totally 1001 sampling points. One thing to mention is that
      Daubechies 5 has already reduce the amout of meaningfu data to 60
      samples. <with|mode|<quote|math>|\<alpha\>> is compression ration,
      <with|mode|<quote|math>|N<rsub|ori>> is the number of sampling points
      in original data that is lager than the threshold, and
      <with|mode|<quote|math>|N<rsub|trans>> is the number of data points in
      tranformed data that is lager than the threshold.|<pageref|auto-52>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Prologue>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|I<space|2spc>Mathematical
      Foundations of Wavelet Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Basic<rigid|>
      Concepts of Wavelet> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      1.1<space|2spc>An Abstract Way of Introducing Discrete Wavelet
      Transform <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      <with|par-left|<quote|1tab>|1.1.1<space|2spc>Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.1.2<space|2spc>Multiresolution Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.1.3<space|2spc>Vanishing Moments and
      Daubechies' Wavelet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      1.2<space|2spc>An Elementary Way of Introducing Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      <with|par-left|<quote|1tab>|1.2.1<space|2spc>Example: Haar Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|1.2.2<space|2spc>Scaling Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|1.2.3<space|2spc>Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Construction
      and Properties of Wavelet System> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      2.1<space|2spc>The Construction of Daubechies Wavelet System
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>

      <with|par-left|<quote|1tab>|2.1.1<space|2spc>Quadrature Mirror Filters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|2.1.2<space|2spc>Derivation of Filter
      Coefficients <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|2.1.3<space|2spc>Construction of Scaling
      Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|2.1.4<space|2spc>Example: The Daubechies 4
      Coefficient Wavelet System <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      2.2<space|2spc>Classification of Wavelet Bases
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>

      2.3<space|2spc>Mallat Transform <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>

      <with|par-left|<quote|1tab>|2.3.1<space|2spc>Multiresolution
      Decomposition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|2.3.2<space|2spc>Multiresolution
      Reconstruction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|2.3.3<space|2spc>The Mallat Transform and
      Inverse Transform Algorithm <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|2.3.4<space|2spc>Notes on Wavelet Transform
      Algorithm <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Wavelet
      in Numerical Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26><vspace|0.5fn>

      3.1<space|2spc>Some Useful Orthogonal Wavelets
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      <with|par-left|<quote|1tab>|3.1.1<space|2spc>Meyer Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1tab>|3.1.2<space|2spc>Shannon Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      <with|par-left|<quote|1tab>|3.1.3<space|2spc>Daubechies Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|1tab>|3.1.4<space|2spc>Symlet Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>>

      <with|par-left|<quote|1tab>|3.1.5<space|2spc>Coiflet Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>>

      <with|par-left|<quote|1tab>|3.1.6<space|2spc>Battle-Lemarie Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      <with|par-left|<quote|1tab>|3.1.7<space|2spc>Biorthogonal spline
      Wavelet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>>

      <with|par-left|<quote|1tab>|3.1.8<space|2spc>Reverse B-spline Wavelet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>>

      3.2<space|2spc>Miscellaneous Staff <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>

      <with|par-left|<quote|1tab>|3.2.1<space|2spc>Learning Resources
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>>

      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|II<space|2spc>Application
      of Wavelet Analysis in CFD> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Miscellaneous
      Staff> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48><vspace|0.5fn>

      4.1<space|2spc>Orthogonal Wavelet with Gaussian Distribution as Scaling
      Function? <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>

      4.2<space|2spc>Approximation of Gaussian Distribution with Orthogonal
      Wavelets <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>