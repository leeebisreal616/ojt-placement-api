import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { Placement } from '../placements/placement.entity';

@Entity('logbook_entries')
export class LogbookEntry {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => Placement)
  @JoinColumn({ name: 'placementId' })
  placement: Placement;

  @Column()
  placementId: number;

  @Column({ type: 'date' })
  entryDate: string;

  @Column({ type: 'text' })
  taskDescription: string;

  @Column({ type: 'float' })
  hoursRendered: number;
}