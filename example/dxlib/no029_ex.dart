import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

// --- 定数 ---
const chipSize = 32.0;
const mapWidth = 20;
const mapHeight = 15;
const gravity = 0.5;
const jumpPower = -9.5;
const moveSpeed = 4.0;

// マップチップの定義（DXライブラリ版に準拠）
const air = 0;
const block = 1;
const slopeUp = 2; // 右上がり ( / )
const slopeDown = 3; // 右下がり ( \ )

// --- 元ソース (ActionSample2.cpp) のマップデータを完全再現 ---
// --- 検証用マップデータ ---
var mapData = <List<int>>[
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 2, 1, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 4, 5, 1, 6, 7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
];

class Player {
  var x = 32.0;
  var y = 300.0;
  var vx = 0.0;
  var vy = 0.0;
  var isGround = false;
  var width = 24.0;
  var height = 30.0;

  void update(Map<int, bool> keys) {
    vx = 0;
    if (keys[SDL_SCANCODE_LEFT] == true) {
      vx = -moveSpeed;
    }
    if (keys[SDL_SCANCODE_RIGHT] == true) {
      vx = moveSpeed;
    }
    if (keys[SDL_SCANCODE_SPACE] == true && isGround) {
      vy = jumpPower;
      isGround = false;
    }

    // 地面にいるなら、重力を蓄積させない（震えの根本原因を断つ）
    if (isGround) {
      vy = 0;
    } else {
      vy += gravity;
    }

    // X移動
    x += vx;
    _collisionX();

    // Y移動
    y += vy; // ここで移動させた後、_collisionYで「床ピッタリ」に修正される
    _collisionY();
  }

  // 坂道を考慮した「地面の高さ」を計算する核心部分
  double getFloorHeight(double px) {
    final tx = px ~/ chipSize;
    final ty = (y + height - 1) ~/ chipSize;

    if (tx < 0 || tx >= mapWidth || ty < 0 || ty >= mapHeight) return 9999;

    final chip = mapData[ty][tx];
    final chipTop = ty * chipSize;
    final relX = px - (tx * chipSize);

    switch (chip) {
      case block:
        return chipTop;
      case slopeUp: // 45度
        return chipTop + (chipSize - relX);
      case slopeDown: // 45度
        return chipTop + relX;

      // --- 緩やかな右上がり (2セル分) ---
      case 4: // 前半（0%〜50%の高さ）
        return chipTop + chipSize - (relX / 2);
      case 5: // 後半（50%〜100%の高さ）
        return chipTop + (chipSize / 2) - (relX / 2);

      // --- 緩やかな右下がり (2セル分) ---
      case 6: // 前半（100%〜50%の高さ）
        return chipTop + (relX / 2);
      case 7: // 後半（50%〜0%の高さ）
        return chipTop + (chipSize / 2) + (relX / 2);
    }

    // 足元が空気の場合の「吸着処理」も拡張
    if (ty + 1 < mapHeight) {
      final downChip = mapData[ty + 1][tx];
      final dTop = (ty + 1) * chipSize;
      if (downChip == slopeUp) {
        return dTop + (chipSize - relX);
      }
      if (downChip == slopeDown) {
        return dTop + relX;
      }
      if (downChip == 4) {
        return dTop + chipSize - (relX / 2);
      }
      if (downChip == 5) {
        return dTop + (chipSize / 2) - (relX / 2);
      }
      if (downChip == 6) {
        return dTop + (relX / 2);
      }
      if (downChip == 7) {
        return dTop + (chipSize / 2) + (relX / 2);
      }
    }
    return 9999;
  }

  void _collisionX() {
    // 壁判定用の点を少し内側に寄せて、角に引っかかりにくくする
    final checkYPoints = <double>[y + 8, y + height / 2, y + height - 8];

    for (final checkY in checkYPoints) {
      final tx = (vx >= 0 ? (x + width) : x) ~/ chipSize;
      final ty = checkY ~/ chipSize;

      if (ty >= 0 && ty < mapHeight && tx >= 0 && tx < mapWidth) {
        if (mapData[ty][tx] == block) {
          if (vx > 0) {
            x = tx * chipSize - width - 0.1; // 0.1px離して完全な重なりを防ぐ
          }
          if (vx < 0) {
            x = (tx + 1) * chipSize + 0.1;
          }
          vx = 0;
          break;
        }
      }
    }
  }

  void _collisionY() {
    if (vy > 12.0) vy = 12.0;

    // --- 1. 接地判定用の床の高さを取得 ---
    final floorL = getFloorHeight(x + 4);
    final floorR = getFloorHeight(x + width - 4);
    final bestFloor = (floorL < floorR) ? floorL : floorR;

    // 移動「前」と「後」の頭の座標
    final prevHeadY = y - vy; // updateで y += vy されているので戻す
    final nextHeadY = y;

    // --- 2. 天井判定（上昇中のすり抜け防止） ---
    if (vy < 0) {
      // 移動前(prevHeadY)から移動後(nextHeadY)の間にブロックがあるかスキャン
      // これにより斜め移動で角を飛び越えるのを防ぐ
      for (var checkY = prevHeadY; checkY >= nextHeadY; checkY -= 4.0) {
        for (final offset in [4.0, width / 2, width - 4.0]) {
          final txHead = (x + offset) ~/ chipSize;
          final tyHead = checkY ~/ chipSize;

          // 空白以外（ブロックや坂の裏側）に当たったら天井ヒット
          if (_getMap(txHead, tyHead) >= 1) {
            y = (tyHead + 1) * chipSize + 0.1;
            vy = 0.5;
            isGround = false;
            return;
          }
        }
      }
    }

    // --- 3. 接地判定 ---
    final currentFeetY = y + height;
    final snapDistance = isGround ? (moveSpeed + 4.0) : 8.0;

    var nextIsGround = false;
    if (vy >= 0) {
      if (currentFeetY >= bestFloor - snapDistance && bestFloor < 9999.0) {
        nextIsGround = true;
      }
    }

    // --- 4. 最終座標確定 ---
    if (nextIsGround) {
      y = bestFloor - height;
      vy = 0;
      isGround = true;
    } else {
      isGround = false;
    }
  }

  // 安全にマップチップを取得するヘルパー
  int _getMap(int tx, int ty) {
    if (tx < 0 || tx >= mapWidth || ty < 0 || ty >= mapHeight) {
      return air;
    }
    return mapData[ty][tx];
  }

  void draw(Pointer<SdlRenderer> renderer) {
    final rect = SdlxFRect()
      ..x = x
      ..y = y
      ..w = width
      ..h = height;
    sdlSetRenderDrawColor(renderer, 255, 0, 0, 255);
    sdlxRenderFillRect(renderer, rect);
    print(
      'Player Position: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
    );
  }
}

void main() {
  sdlInit(SDL_INIT_VIDEO);
  final window = sdlCreateWindow('Dart Action Sample 2', 640, 480, 0);
  final renderer = sdlCreateRenderer(window, null);
  final player = Player();
  final keys = <int, bool>{};

  var running = true;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        if (event.scancode == SdlkScancode.escape) {
          running = false;
        }
      }
    }
    player.update(keys);

    sdlSetRenderDrawColor(renderer, 40, 40, 40, 255);
    sdlRenderClear(renderer);

    for (var ty = 0; ty < mapHeight; ty++) {
      for (var tx = 0; tx < mapWidth; tx++) {
        final chip = mapData[ty][tx];
        if (chip == air) continue;

        final cx = tx * chipSize;
        final cy = ty * chipSize;

        if (chip == block) {
          final r = SdlxFRect()
            ..x = cx
            ..y = cy
            ..w = chipSize
            ..h = chipSize;
          sdlSetRenderDrawColor(renderer, 100, 100, 100, 255);
          sdlxRenderFillRect(renderer, r);
          // main関数内の描画ロジックの一部
        } else if (chip >= 2 && chip <= 7) {
          sdlSetRenderDrawColor(renderer, 0, 200, 0, 255);
          for (double i = 0; i < chipSize; i++) {
            double h;
            if (chip == slopeUp) {
              h = chipSize - i;
            } else if (chip == slopeDown) {
              h = i;
            } else if (chip == 4) {
              h = chipSize - (i / 2); // 右上がり低
            } else if (chip == 5) {
              h = (chipSize / 2) - (i / 2); // 右上がり高
            } else if (chip == 6) {
              h = i / 2; // 右下がり高
            } else {
              h = (chipSize / 2) + (i / 2); // 右下がり低
            }
            sdlRenderLine(renderer, cx + i, cy + chipSize, cx + i, cy + h);
          }
        }
      }
    }
    player.draw(renderer);
    sdlRenderPresent(renderer);
    sdlDelay(16);
  }
  sdlQuit();
}
