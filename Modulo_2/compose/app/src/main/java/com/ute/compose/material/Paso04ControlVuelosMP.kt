package com.ute.compose.material

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
fun Paso03PasajerosVuelosScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text(
            "Control de Vuelos",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        TotalPasajerosVuelos()
    }
}

@Composable
private fun TotalPasajerosVuelos() {

    var vuelo1 by remember { mutableStateOf("0") }
    var vuelo2 by remember { mutableStateOf("0") }
    var totalPasajeros by remember { mutableStateOf("0") }

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            "Total de Pasajeros",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )

        // Vuelo 1
        OutlinedTextField(
            value = vuelo1,
            onValueChange = { vuelo1 = it },
            label = { Text("Pasajeros Vuelo 1") },
            leadingIcon = {
                Icon(Icons.Default.Flight, contentDescription = null)
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Vuelo 2
        OutlinedTextField(
            value = vuelo2,
            onValueChange = { vuelo2 = it },
            label = { Text("Pasajeros Vuelo 2") },
            leadingIcon = {
                Icon(Icons.Default.Flight, contentDescription = null)
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        Button(
            onClick = {
                val pasajeros1 = vuelo1.toIntOrNull() ?: 0
                val pasajeros2 = vuelo2.toIntOrNull() ?: 0

                totalPasajeros = (pasajeros1 + pasajeros2).toString()
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Calcular Total")
        }

        Text(
            "Total de pasajeros transportados: $totalPasajeros"
        )
    }
}

@Preview(showBackground = true)
@Composable
fun Paso03PasajerosVuelosPreview() {
    MaterialTheme {
        Paso03PasajerosVuelosScreen()
    }
}