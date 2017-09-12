--habilitar saida dbms no console
set SERVEROUTPUT On

--bloco anonimo
DECLARE
    x INTEGER;
    y INTEGER;
    c INTEGER;
BEGIN
    x := 10;
    y := 20;
    c := x + y;
    DBMS_OUTPUT.PUT_LINE('Resultado: ' || c);
END;


DECLARE
    VDESCONTO NUMBER(6,2) := 0.50;
    VCIDADE VARCHAR(30) := 'NOVO HAMBURGO';
    VCOD_ALUNO TALUNO.COD_ALUNO%TYPE := 5;
    VTOTAL NUMBER (8,2) := 1245.8;
BEGIN
    VTOTAL := ROUND(VTOTAL * VDESCONTO, 2);     
    DBMS_OUTPUT.PUT_LINE('Total: ' || VTOTAL);
    VDESCONTO := 1.20;
    VCIDADE := INITCAP(VCIDADE);     
    DBMS_OUTPUT.PUT_LINE('Cidade: ' || VCIDADE);     
    DBMS_OUTPUT.PUT_LINE('Desconto: ' || VDESCONTO);     
    DBMS_OUTPUT.PUT_LINE('Aluno: ' || VCOD_ALUNO);    
END;

select * from tcurso;

--IF ELSE
DECLARE
    vPreco1 number(8,2) := 10;
    vPreco2 number(8,2) := 20;
    vFlag boolean;
BEGIN
    vFlag := (vPreco1 > vPreco2);
    if (vFlag=true) then
        DBMS_OUTPUT.PUT_LINE('Verdadeiro');
    else
        DBMS_OUTPUT.PUT_LINE('Falso');
    end if;
    
    if (vPreco1 > vPreco2) then
        DBMS_OUTPUT.PUT_LINE('vPreco1 é maior');
    else
        DBMS_OUTPUT.PUT_LINE('vPreco2 é maior');
    end if;
END;

--bind variable
VARIABLE vDESCONTO2 NUMBER

DECLARE
    VCOD_ALUNO NUMBER := 1;
BEGIN
    :vDESCONTO2 := 0.90;
    DBMS_OUTPUT.PUT_LINE('desconto 2: ' || :vDESCONTO2);
    
    UPDATE TContrato set
    total = total * :vDESCONTO2
    where cod_aluno = vcod_aluno;

END;

select * from tcontrato;

--aninhamento de blocos
declare
    VTESTE VARCHAR(10) := 'JOSE';
begin
    declare
        VTESTE VARCHAR(10) := 'PEDRO';
    begin
        DBMS_OUTPUT.PUT_LINE('Bloco interno: ' || VTESTE);    
    end;
    
    DBMS_OUTPUT.PUT_LINE('Bloco interno: ' || VTESTE);
end;






