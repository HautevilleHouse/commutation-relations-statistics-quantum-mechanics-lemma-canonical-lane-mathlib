import canonicalLaneMathlib.AdmissibleClass
namespace HautevilleHouse
namespace CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean

structure CCR where
  position : ℂ → ℂ
  momentum : ℂ → ℂ
  commutator : (ℂ → ℂ) → (ℂ → ℂ) → (ℂ → ℂ)
  cc : commutator position momentum = λ x => (ⅈ * (λ x => 2*π) x) * identity

open CStarAlgebra

def primitiveCCR : CCR := {
  position := λ x => x
  momentum := λ x => -ⅈ * (λ f => derivative f) (λ x => x) x
  commutator := λ f g => f ∘ g - g ∘ f
  cc := by
    ext x
    simp
}

def CCRClosed (C : CCR) : Prop :=
  C.commutator C.position C.momentum = λ x => (ⅈ * (λ x => 2*π) x) * identity

theorem primitive_ccr_closed : CCRClosed primitiveCCR := by rfl

end CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean
end HautevilleHouse