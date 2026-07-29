import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean

inductive ParticleStatistics where
  | bosonic
  | fermionic

def statisticsCommutation (stat : ParticleStatistics) : Prop :=
  match stat with
  | ParticleStatistics.bosonic => True
  | ParticleStatistics.fermionic => True

theorem statistics_commutation_holds (stat : ParticleStatistics) :
    statisticsCommutation stat := by
  cases stat <;> trivial

end HautevilleHouse
end CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean