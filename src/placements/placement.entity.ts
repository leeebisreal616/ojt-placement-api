import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { User } from '../users/user.entity';

@Entity('placements')
export class Placement {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => User)
  @JoinColumn({ name: 'studentId' })
  student: User;

  @Column()
  studentId: number;

  @Column()
  companyName: string;

  @Column()
  position: string;

  @Column({ default: 'pending' })
  status: string;

  @Column({ type: 'date' })
  startDate: string;

  @Column({ type: 'date', nullable: true })
  endDate: string;
}