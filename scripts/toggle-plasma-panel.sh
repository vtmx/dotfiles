#!/usr/bin/env bash

qdbus org.kde.plasmashell /PlasmaShell evaluateScript "p = panelById(panelIds[0]); p.height = 28 - p.height;"
