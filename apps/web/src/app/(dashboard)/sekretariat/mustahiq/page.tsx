"use client";
import { useAcademicYear } from "@/components/shared/AcademicYearContext";
import { MustahiqTab } from "@/features/sekretariat/components/MustahiqTab";

export default function MustahiqTabPage() {
  const { isReadOnly } = useAcademicYear();
  return <MustahiqTab isReadOnly={isReadOnly} onViewDetail={() => {}} />;
}
