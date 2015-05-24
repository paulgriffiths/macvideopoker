//
//  Cards.swift
//  VideoPoker
//
//  Cards.swift
//
//  Enumeration for all 52 regular playing cards.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

public enum Cards: Int {
    case AceClubs = 0
    case TwoClubs
    case ThreeClubs
    case FourClubs
    case FiveClubs
    case SixClubs
    case SevenClubs
    case EightClubs
    case NineClubs
    case TenClubs
    case JackClubs
    case QueenClubs
    case KingClubs
    case AceHearts
    case TwoHearts
    case ThreeHearts
    case FourHearts
    case FiveHearts
    case SixHearts
    case SevenHearts
    case EightHearts
    case NineHearts
    case TenHearts
    case JackHearts
    case QueenHearts
    case KingHearts
    case AceSpades
    case TwoSpades
    case ThreeSpades
    case FourSpades
    case FiveSpades
    case SixSpades
    case SevenSpades
    case EightSpades
    case NineSpades
    case TenSpades
    case JackSpades
    case QueenSpades
    case KingSpades
    case AceDiamonds
    case TwoDiamonds
    case ThreeDiamonds
    case FourDiamonds
    case FiveDiamonds
    case SixDiamonds
    case SevenDiamonds
    case EightDiamonds
    case NineDiamonds
    case TenDiamonds
    case JackDiamonds
    case QueenDiamonds
    case KingDiamonds
    
    public var card: Card {
        return Card(index: rawValue)
    }
}
