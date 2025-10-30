# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
Write here your answer e.g:
π Pname, Ssn, Fname, Lname ((employee ⨝ (ρ Ssn←Essn (works_on)) ⨝ Pno = Pnumber project))
```


### *b)* 

```
π Fname, Minit, Lname (
    employee
    ⨝ Super_ssn = Boss.Ssn
    ρ Boss (π Ssn σ Fname='Carlos' ∧ Minit='D' ∧ Lname='Gomes' employee)
)
```


### *c)* 

```
γ Pname; sum(Hours) -> TotalHours (
	project ⨝ Pnumber = Pno (works_on)
)
```


### *d)* 

```
π Fname, Lname, Pname, Hours (
	σ Dno = 3 (employee)
	⨝
	Ssn = Essn ∧ Hours > 20 (works_on)
	⨝
	Pno = Pnumber (σ Pname='Aveiro Digital' (project))
)
```


### *e)* 

```
π Fname, Minit, Lname (
    σ Pno=null (
        employee ⟕ Ssn=Essn (works_on)
    )
)
```


### *f)* 

```
γ Dname; avg(Salary) -> AvgSalary (
	department ⨝
	Dnumber = Dno (σ Sex = 'F' (employee))
)
```


### *g)* 

```
σ NumDependents≥2 (
	γ Fname, Lname; count(Fname) -> NumDependents (
		employee ⨝
		Ssn = Essn (dependent)
	)
)
```


### *h)* 

```
π Fname, Lname (
	σ dependent.Essn = null (
		employee ⨝ Mgr_ssn = Ssn (department) ⟕ Ssn = Essn (dependent)
	)
)
```


### *i)* 

```
ProjectEmployee = project ⨝ Pno=Pnumber (
    employee ⨝ Ssn=Essn (works_on)
)

DepartmentLocation = π department.Dnumber, Dname, Dlocation (
    department ⨝ department.Dnumber=dept_location.Dnumber (dept_location)
)

π Ssn, Fname, Minit, Lname, Address (
    σ dept_location.Dlocation≠'Aveiro' ∧ project.Plocation='Aveiro' (
        ProjectEmployee ⨝ Dno=Dnumber (DepartmentLocation)
    )
)
```


## ​Problema 5.2

### *a)*

```
π nome (
	σ numero = null (
		fornecedor ⟕ nif = fornecedor (encomenda)
	)
)
```

### *b)* 

```
γ codProd; media_unidades <- avg(unidades) (item)
```


### *c)* 

```
γ avg(NumProdutos) -> MediaProdutosPorEncomenda (
  γ numEnc; count(codProd) -> NumProdutos (item)
)
```


### *d)* 

```
π nif, nome, codProd, unidades (fornecedor ⨝ encomenda ⨝ item)
```


## ​Problema 5.3

### *a)*

```
π nome (
	σ pres.numUtente = null (
		ρ pac (paciente) ⟕ pac.numUtente = pres.numUtente ρ pres (prescricao)
	)
)
```

### *b)* 

```
γ especialidade; numprescricoes <- count(numPresc) (
	medico ⨝ prescricao
)
```


### *c)* 

```
γ farmacia.nome; count(prescfarm.numPresc) -> NumPrescricoes (
	(ρ prescfarm (presc_farmaco) ⨝ prescfarm.numRegFarm = farmaco.numRegFarm ρ farmaco (farmaco))
	⨝ prescfarm.numPresc = presc.numPresc ρ presc (prescricao) ⨝ presc.farmacia = farmacia.nome ρ farmacia (farmacia)
)
```


### *d)* 

```
π nome (farmaco)-π nomeFarmaco (
	presc_farmaco ⨝ prescricao ⨝ farmaco
)
```

### *e)* 

```
γ farmaceutica.nome; count(*) → NumFarmacos (
  farmaco ⨝ farmaco.numRegFarm = farmaceutica.numReg (farmaceutica)
)
```

### *f)* 

```
... Write here your answer ...
```
