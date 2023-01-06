def pos (β : Type -> Type): Type 1 := Sigma β

def dir (β : Type -> Type) (i : pos β): Type := match i with
  | .mk a _ => a

structure Reg where
  i : Fin 16

inductive Value where
  | reg : Reg -> Value
  | const : Int -> Value

inductive EqRes where
  | eq : EqRes
  | neq : EqRes
  
inductive PISC : Type -> Type where
  | set : Reg -> Value -> PISC Unit
  | add : Reg -> Value -> PISC Unit
  | beq : Reg -> Value -> PISC EqRes

structure P where
  pos : Type 1
  dir : pos -> Type

def MkP (f : Type -> Type): P := { pos := pos f, dir := fun i => dir f i }

-- inductive Comp (p : Type -> Type) (q : Type -> Type) : Type -> Type where
--   | mk : (i : pos p) -> (f : dir p i -> pos q) -> Comp p q (Σ (d : dir p i), dir q (f d))
