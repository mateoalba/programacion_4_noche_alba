import { Text, View } from 'react-native'

import Paso1 from '@/components/paso1'
import Paso2 from '@/components/paso2'
import Paso3 from '@/components/paso3'
import Paso4 from '@/components/paso4'
import Paso5 from '@/components/paso5'
import Paso6 from '@/components/paso6'
import Paso7 from '@/components/paso7'
import Paso8 from '@/components/paso8'
import Paso9 from '@/components/paso9'
import Paso10 from '@/components/paso10'
import Paso11 from '@/components/paso11'
import Paso12 from '@/components/paso12'

const PASO: number = 7

export default function Index() {
  switch (PASO) {
    case 1: return <Paso1 />
    case 2: return <Paso2 />
    case 3: return <Paso3 />
    case 4: return <Paso4 />
    case 5: return <Paso5 />
    case 6: return <Paso6 />
    case 7: return <Paso7 />
    case 8: return <Paso8 />
    case 9: return <Paso9 />
    case 10: return <Paso10 />
    case 11: return <Paso11 />
    case 12: return <Paso12 />
    default:
      return (
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <Text>Paso {PASO}: crea la pantalla primero</Text>
        </View>
      )
  }
}
