<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Alimentación Pellicer</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">


</head>
<body>
<h1 class="page-header">Alimentación Pellicer</h1>
<table>
    <thead>
    <tr>
        <th>Empleado</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>Nombre</td>
        <td>{{ $user->nombre }}</td>
    </tr>
    <tr>
        <td>Apellidos</td>
        <td>{{ $user->apellidos }}</td>
    </tr>
    <tr>
        <td>Dirección</td>
        <td>{{ $user->direccion }}</td>
    </tr>
    <tr>
        <td>Teléfono</td>
        <td>{{ $user->telefono }}</td>
    </tr>
    </tbody>
</table>
<table class="table table-hover table-striped">
    <thead>
    <tr>
        <th>Nómina {{ $nomina->fecha_nomina }}</th>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td>Salario Base</td>
            <td>{{ $nomina->salario_base }}€</td>
        </tr>
        <tr>
            <td>Seguridad social</td>
            <td>{{ $nomina->seg_social * 100 }}%</td>
        </tr>
        <tr>
            <td>I.R.P.F</td>
            <td>{{ $nomina->irpf * 100 }}%</td>
        </tr>
        <tr>
            <td>Horas Extra</td>
            <td>{{ $nomina->horas_extra }}</td>
        </tr>
        <tr>
            <td>Precio Hora Extra</td>
            <td>{{ $nomina->precio_hora_extra }}€</td>
        </tr>
        @if ($nomina->paga_extra != 0)
            <tr>
                <td>Paga Extraordinaria</td>
                <td>{{ $nomina->paga_extra }}€</td>
            </tr>

        <tr>
            <td>Total sin Devengos</td>
            <td>{{ $nomina->salario_base + ($nomina->horas_extra * $nomina->precio_hora_extra) + $nomina->paga_extra}}€</td>
        </tr>
        @else

            <tr>
                <td>Total sin Devengos</td>
                <td>{{ $nomina->salario_base + ($nomina->horas_extra * $nomina->precio_hora_extra) }}€</td>
            </tr>
        @endif

        <tr>
            <td>Devengos</td>
            <td>{{ ($nomina->salario_base * $nomina->seg_social) + ($nomina->salario_base * $nomina->irpf) }}€</td>
        </tr>
        <tr>
            <td>Total</td>
            <td>{{ $nomina->total }}€</td>
        </tr>
    </tbody>
</table>

</body>
</html>
