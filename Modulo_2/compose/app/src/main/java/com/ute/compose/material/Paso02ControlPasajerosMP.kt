// ui/Paso01_TextField.kt
package com.example.compose.material

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Flight
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso01ControlVuelosScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {

        Text(
            text = "Control de Vuelos",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        RegistroPasajeros()
    }
}

@Composable
private fun RegistroPasajeros() {

    // Variables
    var numeroVuelo by remember { mutableStateOf("") }
    var capacidad by remember { mutableStateOf("") }
    var pasajerosRegistrados by remember { mutableStateOf("") }

    var disponibles by remember { mutableStateOf(0) }
    var ocupacion by remember { mutableStateOf(0.0) }

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            text = "Registro de Pasajeros",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )

        // Número de vuelo
        OutlinedTextField(
            value = numeroVuelo,
            onValueChange = { numeroVuelo = it },
            label = { Text("Número de vuelo") },
            leadingIcon = {
                Icon(Icons.Default.Flight, contentDescription = null)
            },
            keyboardOptions = KeyboardOptions(
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Capacidad del avión
        OutlinedTextField(
            value = capacidad,
            onValueChange = { capacidad = it },
            label = { Text("Capacidad del avión") },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Pasajeros registrados
        OutlinedTextField(
            value = pasajerosRegistrados,
            onValueChange = { pasajerosRegistrados = it },
            label = { Text("Pasajeros registrados") },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Botón calcular
        Button(
            onClick = {

                val cap = capacidad.toIntOrNull() ?: 0
                val pasajeros = pasajerosRegistrados.toIntOrNull() ?: 0

                disponibles = cap - pasajeros

                ocupacion =
                    if (cap > 0)
                        (pasajeros.toDouble() / cap) * 100
                    else
                        0.0
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Calcular")
        }

        HorizontalDivider()

        // Resultados
        Text("Número de vuelo: $numeroVuelo")
        Text("Capacidad total: $capacidad pasajeros")
        Text("Pasajeros registrados: $pasajerosRegistrados")
        Text("Asientos disponibles: $disponibles")
        Text("Porcentaje de ocupación: ${"%.2f".format(ocupacion)}%")
    }
}

@Preview(showBackground = true)
@Composable
fun Paso01ControlVuelosPreview() {
    MaterialTheme {
        Paso01ControlVuelosScreen()
    }
}