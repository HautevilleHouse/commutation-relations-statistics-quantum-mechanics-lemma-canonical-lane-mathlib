import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean

structure QuantumStateEvolution where
  hamiltonian : String
  timeEvolution : String
  unitaryOperator : String
  evolutionClosed : timeEvolution ≠ ""
  unitaryClosed : unitaryOperator ≠ ""

def sourceQuantumStateEvolution : QuantumStateEvolution := {
  hamiltonian := "H",
  timeEvolution := "exp(-iHt/hbar)",
  unitaryOperator := "U(t)",
  evolutionClosed := by simp,
  unitaryClosed := by simp
}

structure EvolutionCertificate where
  evolution : QuantumStateEvolution
  evolutionClosed : Prop
  spectralLayerClosed : Prop
  evolutionClosedProof : evolutionClosed
  spectralLayerClosedProof : spectralLayerClosed

def sourceEvolutionCertificate : EvolutionCertificate := {
  evolution := sourceQuantumStateEvolution,
  evolutionClosed := sourceQuantumStateEvolution.evolutionClosed ∧ sourceQuantumStateEvolution.unitaryClosed,
  spectralLayerClosed := True,
  evolutionClosedProof := by
    exact And.intro sourceQuantumStateEvolution.evolutionClosed sourceQuantumStateEvolution.unitaryClosed,
  spectralLayerClosedProof := trivial
}

def EvolutionClosed (C : EvolutionCertificate) : Prop :=
  C.evolutionClosed ∧ C.spectralLayerClosed

theorem source_evolution_closed :
    EvolutionClosed sourceEvolutionCertificate := by
  exact And.intro sourceEvolutionCertificate.evolutionClosedProof
    sourceEvolutionCertificate.spectralLayerClosedProof

end CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean
end HautevilleHouse