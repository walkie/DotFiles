" Latex-style mappings for common mathematical characters
function! SymbolMacros()
  " Arrows
  " Single
  imap <buffer> \to →
  imap <buffer> \rightarrow →
  imap <buffer> \gets ←
  imap <buffer> \leftarrow ←
  imap <buffer> \uparrow ↑
  imap <buffer> \downarrow ↓
  imap <buffer> \leftrightarrow ↔
  " Double
  imap <buffer> \implies ⟹
  imap <buffer> \Rightarrow ⇒
  imap <buffer> \Leftarrow ⇐
  imap <buffer> \iff ⟺
  imap <buffer> \Leftrightarrow ⇔
  imap <buffer> \Uparrow ⇑
  imap <buffer> \Downarrow ⇓
  " Diagonal
  imap <buffer> \nearrow ↗
  imap <buffer> \searrow ↘
  imap <buffer> \swarrow ↙
  imap <buffer> \nwarrow ↖
  " Other
  imap <buffer> \multimap ⊸
  imap <buffer> \lollipop ⊸
  imap <buffer> \mapsto ↦
  imap <buffer> \rightsquigarrow ⇝
  imap <buffer> \twoheadrightarrow ↠
  imap <buffer> \hookrightarrow ↪

  " Brackets
  " Angle
  imap <buffer> \langle ⟨
  imap <buffer> \rangle ⟩
  " Double
  imap <buffer> \llbracket ⟦
  imap <buffer> \rrbracket ⟧
  " Floor
  imap <buffer> \lfloor ⌊
  imap <buffer> \rfloor ⌋
  " Ceiling
  imap <buffer> \lceil ⌈
  imap <buffer> \rceil ⌉

  " Logic
  " Truth values
  imap <buffer> \top ⊤
  imap <buffer> \bot ⊥
  " Quantifiers
  imap <buffer> \forall ∀
  imap <buffer> \exists ∃
  imap <buffer> \notexists ∄
  " Boolean operators
  imap <buffer> \land ∧
  imap <buffer> \lor ∨
  imap <buffer> \neg ¬
  " Modal operators
  imap <buffer> \triangleright ▷
  imap <buffer> \square □
  imap <buffer> \diamond ♢

  " Sets & domains
  " Empty
  imap <buffer> \emptyset ∅
  " Membership
  imap <buffer> \in ∈
  imap <buffer> \notin ∉
  " Relations
  imap <buffer> \subset ⊂
  imap <buffer> \supset ⊃
  imap <buffer> \subseteq ⊆
  imap <buffer> \supseteq ⊇
  imap <buffer> \sqsubset ⊏
  imap <buffer> \sqsupset ⊐
  imap <buffer> \sqsubseteq ⊑
  imap <buffer> \sqsupseteq ⊒
  " Operations
  imap <buffer> \cup ∪
  imap <buffer> \cap ∩
  imap <buffer> \sqcup ⊔
  imap <buffer> \sqcap ⊓
  imap <buffer> \setminus ∖

  " Math
  " Arithmetic and basic operators
  imap <buffer> \pm ±
  imap <buffer> \cdot ⋅
  imap <buffer> \times ×
  imap <buffer> \div ÷
  " Relations
  imap <buffer> \neq ≠
  imap <buffer> \le ≤
  imap <buffer> \leq ≤
  imap <buffer> \ge ≥
  imap <buffer> \geq ≥
  imap <buffer> \equiv ≡
  imap <buffer> \approx ≈
  imap <buffer> \propto ∝
  " Big operators
  imap <buffer> \sum ∑
  imap <buffer> \prod ∏
  " Calculus
  imap <buffer> \int ∫
  imap <buffer> \partial ∂
  imap <buffer> \infty ∞
  " Algebra
  imap <buffer> \oplus ⊕
  imap <buffer> \otimes ⊗

  " PL & and type theory
  " Turnstyles
  imap <buffer> \vdash ⊢
  imap <buffer> \dashv ⊣
  imap <buffer> \vDash ⊨
  imap <buffer> \Dashv ⫤
  " Functions and monads
  imap <buffer> \circ ∘
  imap <buffer> \ll ≪
  imap <buffer> \gg ≫
  imap <buffer> \bind ≫=

  " Greek letters
  imap <buffer> \alpha α
  imap <buffer> \beta β
  imap <buffer> \chi χ
  imap <buffer> \Delta Δ
  imap <buffer> \delta δ
  imap <buffer> \epsilon ε
  imap <buffer> \eta η
  imap <buffer> \Gamma Γ
  imap <buffer> \gamma γ
  imap <buffer> \iota ι
  imap <buffer> \kappa κ
  imap <buffer> \Lambda Λ
  imap <buffer> \lambda λ
  imap <buffer> \mu μ
  imap <buffer> \nu ν
  imap <buffer> \Omega Ω
  imap <buffer> \omega ω
  imap <buffer> \Phi Φ
  imap <buffer> \phi φ
  imap <buffer> \Pi Π
  imap <buffer> \pi π
  imap <buffer> \Psi Ψ
  imap <buffer> \psi ψ
  imap <buffer> \rho ρ
  imap <buffer> \Sigma Σ
  imap <buffer> \sigma σ
  imap <buffer> \tau τ
  imap <buffer> \Theta Θ
  imap <buffer> \theta θ
  imap <buffer> \Upsilon Υ
  imap <buffer> \upsilon υ
  imap <buffer> \Xi Ξ
  imap <buffer> \xi ξ
  imap <buffer> \zeta ζ
endfunction
