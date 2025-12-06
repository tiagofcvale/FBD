# BD: Guião 9


## ​9.1. Complete a seguinte tabela.
Complete the following table.

| #    | Query                                                                                                      | Rows  | Cost  | Pag. Reads | Time (ms) | Index used | Index Op.            | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :---- | :---- | :--------- | :-------- | :--------- | :------------------- | :--------- |
| 1    | SELECT * from Production.WorkOrder                                                                         | 72591 | 0.484 | 531        | 1171      | …          | Clustered Index Scan |            |
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  |       |       |            |           |            |                      |            |
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                               |       |       |            |           |            |                      |            |
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                   |       |       |            |           |            |                      |            |
| 4    | SELECT * FROM Production.WorkOrder WHERE StartDate = '2007-06-25'                                          |       |       |            |           |            |                      |            |
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757                                                   |       |       |            |           |            |                      |            |
| 6.1  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757                              |       |       |            |           |            |                      |            |
| 6.2  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945                              |       |       |            |           |            |                      |            |
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04'            |       |       |            |           |            |                      |            |
| 7    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |       |       |            |           |            |                      |            |
| 8    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |       |       |            |           |            |                      |            |

## ​9.2.

### a)

```
ALTER TABLE mytemp
ADD CONSTRAINT PK_mytemp
PRIMARY KEY CLUSTERED (rid);
```

### b)

```
Inserted      50000 total records
Milliseconds used: 29960

Percentagem de fragmentação dos índices: 99,29 %
Percentagem de ocupação das páginas dos índices: 99,88 %
```

### c)

#### FillFactor = 65

```
ALTER INDEX PK_mytemp ON mytemp
REBUILD WITH (FILLFACTOR = 65);
```

Tempo de inserção: 2:56


#### FillFactor = 80

```
ALTER INDEX PK_mytemp ON mytemp
REBUILD WITH (FILLFACTOR = 80);
```

Tempo de inserção: 2:53

#### FillFactor = 90

```
ALTER INDEX PK_mytemp ON mytemp
REBUILD WITH (FILLFACTOR = 90);
```

Tempo de inserção: 2:52

### d)

```
CREATE TABLE mytemp (
    rid BIGINT IDENTITY (1, 1) NOT NULL,
    at1 INT NULL,
    at2 INT NULL,
    at3 INT NULL,
    lixo varchar(100) NULL
);
```

#### FillFactor = 65

```
ALTER INDEX PK_mytemp ON mytemp
REBUILD WITH (FILLFACTOR = 65);
```

Tempo de inserção: 2:52


#### FillFactor = 80

```
ALTER INDEX PK_mytemp ON mytemp
REBUILD WITH (FILLFACTOR = 80);
```

Tempo de inserção: 2:51

#### FillFactor = 90

```
ALTER INDEX PK_mytemp ON mytemp
REBUILD WITH (FILLFACTOR = 90);
```

Tempo de inserção: 2:52

### e)

```
CREATE INDEX Index_mytemp_at1 ON mytemp(at1);

CREATE INDEX Index_mytemp_at2 ON mytemp(at2);

CREATE INDEX Index_mytemp_at3 ON mytemp(at3);
```

Observa-se um aumento nos tempos de inserção obitos, devido ao facto que a operação é executada para cada índice criado.

## ​9.3.

```
... Write here your answer ...
```
