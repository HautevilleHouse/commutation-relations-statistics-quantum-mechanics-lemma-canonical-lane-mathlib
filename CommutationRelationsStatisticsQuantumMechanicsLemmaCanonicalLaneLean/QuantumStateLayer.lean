import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean

structure QuantumState where
  description : String
  energy : ℚ

def groundState : QuantumState := {
  description := "ground state",
  energy := 0
}

def stateClosed (s : QuantumState) : Prop :=
  s.energy ≥ 0

theorem ground_state_energy_nonnegative : stateClosed groundState := by
  unfold stateClosed groundState
  norm_num

end HautevilleHouse
end CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean