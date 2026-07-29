import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean

structure OperatorAlgebra where
  carrier : Set (ℂ → ℂ)
  adjoint : (ℂ → ℂ) → (ℂ → ℂ)
  identity : ℂ → ℂ

structure CStarAlgebra extends OperatorAlgebra where
  norm : (ℂ → ℂ) → ℝ
  norm_axiom : ∀ a, norm (adjoint a * a) = norm a ^ 2

def primitiveCStarAlgebra : CStarAlgebra := {
  carrier := Set.univ
  adjoint := λ f x => conj (f x)
  identity := λ x => 1
  norm := λ f => 0
  norm_axiom := λ _ => rfl
}

def CStarAlgebraClosed (A : CStarAlgebra) : Prop :=
  A.adjoint A.identity = A.identity

theorem primitive_cstar_identity_adjoint :
    CStarAlgebraClosed primitiveCStarAlgebra := by rfl

end CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean
end HautevilleHouse