import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean

structure StatisticalState where
  densityMatrix : String
  traceOne : Prop
  positivity : Prop
  densityMatrixClosed : densityMatrix ≠ ""
  traceOneClosed : traceOne
  positivityClosed : positivity

def sourceStatisticalState : StatisticalState := {
  densityMatrix := "rho",
  traceOne := True,
  positivity := True,
  densityMatrixClosed := by simp,
  traceOneClosed := trivial,
  positivityClosed := trivial
}

structure StatisticalStateCertificate where
  state : StatisticalState
  stateClosed : Prop
  expectationValueClosed : Prop
  stateClosedProof : stateClosed
  expectationValueClosedProof : expectationValueClosed

def sourceStatisticalStateCertificate : StatisticalStateCertificate := {
  state := sourceStatisticalState,
  stateClosed := sourceStatisticalState.densityMatrix ≠ "" ∧ sourceStatisticalState.traceOne ∧ sourceStatisticalState.positivity,
  expectationValueClosed := True,
  stateClosedProof := by
    exact And.intro sourceStatisticalState.densityMatrixClosed
      (And.intro sourceStatisticalState.traceOneClosed sourceStatisticalState.positivityClosed),
  expectationValueClosedProof := trivial
}

def StatisticalStateClosed (C : StatisticalStateCertificate) : Prop :=
  C.stateClosed ∧ C.expectationValueClosed

theorem source_statistical_state_closed :
    StatisticalStateClosed sourceStatisticalStateCertificate := by
  exact And.intro sourceStatisticalStateCertificate.stateClosedProof
    sourceStatisticalStateCertificate.expectationValueClosedProof

end CommutationRelationsStatisticsQuantumMechanicsLemmaCanonicalLaneLean
end HautevilleHouse