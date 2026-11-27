-- Hand-written Lean 4 proofs for extracted Rust functions.
-- After running `just extract` (`cargo hax into lean`), import the generated
-- modules from `extraction/` here and prove properties about them.

theorem sample_check : 1 + 1 = 2 := rfl
