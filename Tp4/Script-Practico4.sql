use Practico4;

-- Controlar el estado de las cuentas antes de depositar o extraer
select * from Cuentas where numero_cuenta = 1002;
-- Extraer y Depositar (Procedimientos)
call Depositar(1003,180000);
call Extraer(1006,1000);
-- Chequear los procedimientos
SELECT numero_cuenta, saldo FROM Cuentas WHERE numero_cuenta = 1002;
-- Ver estados de cuenta con saldo mayor a parametro
call CuentasConSaldoMayorQue(2000);
-- Chequear movimientos independientemente
SELECT * FROM Historial_movimientos WHERE numero_cuenta = 1002;
-- Procedimiento para ver los movimientos unificados sin cursor (Debito resta y Credito suma)
call TotalMovimientosDelMes(1002,@total);
-- Procedimiento para ver los movimientos unificados con cursor (Debito resta y Credito suma)
call TotalMovimientosDelMesCursor(1002, @total);
-- Aplicar interes
CALL AplicarInteresCursor(2, 100000);
-- ver cuentas
call VerCuentas();

-- el trigger funciona autonomamente cuando se usan los porcedimientos Extraer y Depositar

