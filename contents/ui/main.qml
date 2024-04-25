import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0

Item {
    id: root

    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation

    Plasmoid.compactRepresentation: RowLayout {
        function exec() {
            var cmd = query.text;
            if (cmd != "") {
                query.text = "";
                execute.connectSource(cmd);
            }
        }

        PlasmaCore.DataSource {
            id: execute

            engine: "executable"
            connectedSources: []
            onNewData: disconnectSource(sourceName)
        }

        PlasmaComponents3.TextField {
            id: query

            Keys.onReturnPressed: {
                exec();
            }
        }

        PlasmaComponents3.Button {
            text: ">"
            onClicked: {
                exec();
            }
        }
    }
}