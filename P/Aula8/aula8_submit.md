# BD: Guião 8


## ​8.1
 
### *a)*

```
CREATE PROCEDURE Company.getManagerInfo
AS
BEGIN
    -- Obtéém a data atual
    DECLARE @currentDate AS DATE = GETDATE();

    -- Cria uma tabela temporaria para armazenar os dados dos gestores
    CREATE TABLE #ManagerInfo(
        Ssn VARCHAR(10),
        YearsOfService INT
    );

    -- Insere os dados dos gestores na tabela temporaria
    INSERT INTO #ManagerInfo (Ssn, YearsOfService)
    SELECT Mgr_ssn, DATEDIFF(YEAR, Mgr_start_date, @currentDate) AS YearsOfService
    FROM DEPARTMENT WHERE Mgr_ssn IS NOT NULL;

    -- Obtem os dados dos gestores
    SELECT Emp.Fname, Emp.Minit, Emp.Lname, Emp.Ssn, Dep.Mgr_ssn, MI.YearsOfService
    FROM Company.EMPLOYEE EMP
    INNER JOIN Company.DEPARTMENT DEP ON EMP.Ssn = Dep.Mgr_ssn
    INNER JOIN #ManagerInfo MI ON Emp.Ssn = MI.Ssn;

    -- Obtem o SSN e numero de anos do gestor mais antigo
    SELECT TOP 1 Ssn, YearsOfService
    FROM #ManagerInfo
    ORDER BY YearsOfService DESC;

    -- Remove a tabela temporaria
    DROP TABLE #ManagerInfo
end
```

### *b)* 

```
CREATE TRIGGER tr_check_salary ON Company.EMPLOYEE
AFTER INSERT, UPDATE
AS
BEGIN
    -- Verifica se háá funcionarios com salario superior ao gestor do seu departamento
    IF EXISTS (
        SELECT Emp.Ssn
        FROM Company.EMPLOYEE AS Emp
        INNER JOIN Company.DEPARTMENT Dep ON Emp.Dno = Dep.Dnumber
        INNER JOIN Company.EMPLOYEE Manager ON Dep.Mgr_ssn = Manager.Ssn
        WHERE Emp.Ssn IN (
            SELECT Ssn
            FROM inserted
            ) AND Emp.Salary > (Manager.Salary - 1)
    )
    BEGIN
        -- Atualiza o salario dos funcionarios para o salario do gestor com menos 1 unidade
        UPDATE Emp
        SET Emp.Salary = Manager.Salary -1
        FROM Company.EMPLOYEE Emp
        INNER JOIN Company.DEPARTMENT Dep ON Emp.Dno = Dep.Dnumber
        INNER JOIN Company.EMPLOYEE MANAGER ON Dep.Mgr_ssn = MANAGER.Ssn
        WHERE Emp.Ssn IN (
            SELECT Ssn
            FROM inserted
            ) AND Emp.Salary > (Manager.Salary - 1);
    end;
end
```

### *c)* 

```
... Write here your answer ...
```

### *d)* 

```
... Write here your answer ...
```

### *e)* 

```
... Write here your answer ...
```

### *f)* 

```
CREATE FUNCTION getEmpsAboveAvgSalary(@Dno INT)

RETURNS TABLE AS
RETURN (
    SELECT Emp.Fname, Emp.Minit, Emp.Lname, Emp.Salary
    FROM Company.EMPLOYEE EMP
    WHERE EMP.Dno = @Dno
    AND Emp.Salary > (
        SELECT AVG(Salary)
        FROM Company.EMPLOYEE
        Where Dno = @Dno
    )
);
```

### *g)* 

```
... Write here your answer ...
```

### *h)* 

```
... Write here your answer ...
```

### *i)* 

```
... Write here your answer ...
```
